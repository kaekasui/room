Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :dropbox, ENV['DROPBOX_KEY'], ENV['DROPBOX_SECRET']
end
