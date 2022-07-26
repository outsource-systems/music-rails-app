
desc 'Import data from spotify'
namespace :import_data do
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

  task update_items_product_id: :environment do
    service = ImportDataFromSpotifyService.new("5ueB0CVSf1FYLCRCQeycLY")
    service.update_items_product_id
  end
end
