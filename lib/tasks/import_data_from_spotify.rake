
desc 'Import data from spotify'
namespace :import_data do
  # 基本的にこれだけやれば良い
  task from_spotify: :environment do
    ActiveRecord::Base.transaction do
      service = ImportDataFromSpotifyService.new("5ueB0CVSf1FYLCRCQeycLY")
      service.exec
    end
  end

  task top_tracks: :environment do
    service = ImportDataFromSpotifyService.new("5ueB0CVSf1FYLCRCQeycLY")
    service.save_top_tracks
  end

  task artist_poster_url: :environment do
    service = ImportDataFromSpotifyService.new("5ueB0CVSf1FYLCRCQeycLY")
    service.update_artists_poster_url
  end

  task update_albums_poster_url: :environment do
    service = ImportDataFromSpotifyService.new("5ueB0CVSf1FYLCRCQeycLY")
    service.update_albums_poster_url
  end

  task update_artists_assignment: :environment do
    service = ImportDataFromSpotifyService.new("5ueB0CVSf1FYLCRCQeycLY")
    service.update_artists_product_assignment
    service.update_artists_item_assignment
  end
end
