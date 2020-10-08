unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['S3_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['S3_SECRET_ACCESS_KEY'],
      region: 'ap-northeast-1' #envにまとめる
    }

    config.fog_directory  = 'free-walking-tour'#envにまとめる
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/free-walking-tour'
    config.cache_storage = :fog
  end
end