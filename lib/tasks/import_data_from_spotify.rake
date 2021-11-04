
desc 'Import data from spotify'
task import_data_from_spotify: :environment do
  ActiveRecord::Base.transaction do
    RSpotify::authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_CLIENT_SECRET'])

    artist_id = "5ueB0CVSf1FYLCRCQeycLY"

    artist = RSpotify::Artist.find(artist_id)
    artist.albums.each do |album|

      # アーティストを保存
      # genresをcategoryに保存
      # トラックを保存
    end

    # トラックのMP3を取得して保存
  end
end