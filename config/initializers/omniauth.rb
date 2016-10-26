require File.expand_path('lib/omniauth/strategies/polity', Rails.root)
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], app_id: ENV['FACEBOOK_KEY'], scope: "email"
  provider :polity, ENV['OAUTH_ID'], ENV['OAUTH_SECRET']
end
