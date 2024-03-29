class ImportDataFromSpotifyService
  def initialize(artist_id)
    RSpotify.authenticate(ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_CLIENT_SECRET"])
    @artist = RSpotify::Artist.find(artist_id)
  end

  def exec
    create_artist(@artist)
    index = 0
    loop do
      p "start loop"
      offset = 50 * index
      albums = @artist.albums(limit: 50, offset: offset)
      albums.each_with_index do |album, album_index|
        p "start save album index: #{album_index}"
        save_album(album)
        p "finish save album index: #{album_index}"
      end
      break if albums.count < 50

      index += 1
    end

    save_top_tracks
  end

  def save_top_tracks
    category = Category.find_by(name: "Top Songs")
    category = Category.create!(name: "Top Songs") if category.blank?
    CategoryItemAssignment.where(category_id: category.id).destroy_all
    @artist.top_tracks(:JP).each.with_index(1) do |track, index|
      item = Item.find_by(spotify_id: track.id)
      item = save_track(track, index, track.artists.map(&:name).join(", ")) if item.blank?
      CategoryItemAssignment.create(category_id: category.id, item_id: item.id, sort_number: index) if item.present?
    end
  end

  private

  def update_artist_item_assignment(artist, item)
    creator_artist = Artist.find_by(spotify_id: artist.id)
    creator_artist = create_artist(artist) if creator_artist.blank?
    CreatorItemAssignment.create(creator_id: creator_artist.id, item_id: item.id)
  end

  def create_artist(artist)
    return if Artist.exists?(spotify_id: artist.id)

    creator_artist = Artist.new(name: artist.name,
                                spotify_id: artist.id)
    creator_artist.remote_poster_url_url = artist.images.first["url"] if artist.images.present?
    creator_artist.save!
    creator_artist
  end

  def save_album(album) # rubocop:disable Metrics/AbcSize, Metrics/PerceivedComplexity
    return if Product.exists?(spotify_id: album.id)

    # productの保存
    product = Product.create!(
      name: album.name,
      release_date: album.release_date,
      remote_poster_url_url: album.images.first["url"],
      spotify_id: album.id,
      record_type: album.album_type,
    )

    # アーティストを保存
    # Artist
    album.artists.each do |artist|
      create_artist(artist)
      creator_artist = Artist.find_by(spotify_id: artist.id)
      CreatorProductAssignment.create(creator_id: creator_artist.id, product_id: product.id)
    end

    # genresをcategoryに保存
    album.genres.each do |genre|
      category = Category.find_by(name: genre)
      category = Category.create!(name: genre) if category.blank?
      CategoryProductAssignment.create!(category_id: category.id, product_id: product.id)
    end

    artist_name = album.artists.map(&:name).join(", ")

    # トラックを保存
    album.tracks_cache.each_with_index do |track, index|
      save_track(track, index, artist_name, product)
      item = Item.find_by(spotify_id: track.id)
      if item.present?
        track.artists.each do |artist|
          update_artist_item_assignment(artist, item)
        end
      end
    end
  end

  def save_track(track, index, artist_name, product = nil)
    p "start save track index: #{index}"
    track_name = "#{track.name} - #{artist_name} - #{track.album.name}"
    p track_name
    url = track.external_urls["spotify"]
    output_filename = Rails.root.join("tmp/download", "#{track_name}.{ext}").to_s
    local_filename = Rails.root.join("tmp/download", "#{track_name}.mp3").to_s
    `spotdl #{url} --path-template '#{output_filename}' --output-format mp3` if url.present? && !File.exist?(local_filename) # rubocop:disable Layout/LineLength

    audio = Audio.new(
      name: track.name,
      time: Time.at(track.duration_ms), # TODO: 秒数の数字を文字にする
      sort_number: track.track_number,
      spotify_id: track.id,
    )
    audio.product_id = product.id if product.present?

    if File.exist?(local_filename)
      audio.url = File.open(local_filename)
    else
      audio.remote_url_url = track.preview_url
    end
    audio.save!

    # ファイルを削除する
    # File.delete(local_filename) if File.exist?(local_filename)
    p "finish save track index: #{index}"
    audio
  end
end
