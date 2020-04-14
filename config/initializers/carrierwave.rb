require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  # 下の記載はローカル環境からS3に保存するもの仮置き
  # config.storage = :fog
  # config.fog_provider = 'fog/aws'
  
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Rails.application.credentials[:aws][:access_key_id],
    aws_secret_access_key: Rails.application.credentials[:aws][:secret_access_key],
    region: 'ap-northeast-1'
  }

  config.fog_directory = 'freemarket72h' if Rails.env.production?
  config.fog_directory = 'https://s3-ap-northeast-1.amazonaws.com/freemarket72h' if Rails.env.development?



# 下の記載はローカル環境からS3に保存するもの仮置き
  # config.fog_directory  = 'freemarket72h'
  # config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/freemarket72h'
end