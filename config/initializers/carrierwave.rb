require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test? #開発とテストは今まで通りに
    config.storage = :file
    config.enable_processing = false if Rails.env.test? #test:処理をスキップ
  else #本番はS3に保存する
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.secrets.aws_access_key_id,
      aws_secret_access_key: Rails.application.secrets.aws_secret_access_key,
      region: 'ap-northeast-1'
    }
    config.fog_directory  = 'share-childcare'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/share-childcare'
  end

  # config.fog_attributes = {cache_control: 'max-age=31536000', expires: 1.year.from_now.httpdate}
  config.fog_attributes = {expires: 1.year.from_now.httpdate}
  config.fog_public = true
end