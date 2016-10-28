Rails.application.config.middleware.use OmniAuth::Builder do
  provider :polity, ENV['OAUTH_ID'], ENV['OAUTH_SECRET']
end
