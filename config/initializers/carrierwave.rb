require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Rails.application.credentials.aws_access_key_id,
    aws_secret_access_key: Rails.application.credentials.aws_secret_access_key,
    region: 'ap-northeast-1'
  }

  config.fog_directory  = 'freemarket68e'
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/freemarket68e'
  config.asset_host = 'https://freemarket68e.s3.amazonaws.com'
end