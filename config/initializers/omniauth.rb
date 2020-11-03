Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET_KEY']
  provider :facebook, ENV['APP_ID'], ENV['APP_SECRET_KEY']
end