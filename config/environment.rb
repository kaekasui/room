# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Room::Application.initialize!

=begin
ActionMailer::Base.smtp_settings = {
  user_name: ENV['SENDGRID_USERNAME'],
  :password => ENV['SENDGRID_PASSWORD'],
  :domain => "appstair.com",
  :address => "smtp.sendgrid.net",
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
=end
