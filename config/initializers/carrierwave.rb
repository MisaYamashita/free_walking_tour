unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIA4QL7PKNXLDPETWX7',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
    }

    config.fog_directory  = 'free-walking-tour'
    config.asset_host = 'https://free-walking-tour.s3.amazonaws.com'
    config.cache_storage = :fog
  end
end