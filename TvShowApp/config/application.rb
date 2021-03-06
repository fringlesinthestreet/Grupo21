require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TvShowApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.


    ActionMailer::Base.smtp_settings = {

      :address      => 'smtp.gmail.com',
      :domain       => 'mail.google.com',
      :port         => 587,
      :user_name    => "tvshowappiic2143@gmail.com", # ENV['GMAIL_USERNAME']
      :password     => "contrasena",      # ENV['GMAIL_PASSWORD']
      :authentication => 'login',
      :enable_starttls_auto => true
    }
	
    config.active_record.observers = :video_observer

  end

end
