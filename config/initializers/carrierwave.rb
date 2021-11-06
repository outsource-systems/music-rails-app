require "carrierwave/storage/abstract"
require "carrierwave/storage/file"
require "carrierwave/storage/fog"

CarrierWave.configure do |config|
  # storage, cache_storageはfog(外部サービス指定)
  config.storage :fog
  config.fog_provider = "fog/aws"
  config.cache_storage = :fog
  config.fog_public = false

  if Rails.env.development? || Rails.env.test?
    # ブラウザから参照する際のパスを指定(http://ドメイン/バケット名)
    config.asset_host = "http://localhost:9000/origify"
    config.fog_directory = "origify"

    config.fog_credentials = {
      provider: "AWS",
      aws_access_key_id: "minio",
      aws_secret_access_key: "minio123",
      region: ENV["AWS_REGION"],
      path_style: true,
      host: "http://localhost:9000",
      endpoint: "http://localhost:9000",
    }
  else
    config.fog_credentials = {
      provider: ENV["CARRIERWAVE_PROVIDER"],
      aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
      aws_secret_access_key: (ENV["AWS_SECRET_ACCESS_KEY"]).to_s,
      region: ENV["AWS_REGION"],
    }
  end
end
