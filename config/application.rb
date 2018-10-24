# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Grasruts
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
    config.to_prepare do
      VideoInfo.provider_api_keys = { youtube: ENV['YOUTUBE_KEY'], vimeo: ENV['VIMEO_KEY'] }
    end
    config.time_zone = 'Kathmandu'
    config.active_record.default_timezone = :local # Or :utc
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    Raven.configure do |config|
      config.dsn = ENV['SENTRY_DSN']
    end

    config.async = lambda { |event|
      Thread.new { Raven.send_event(event) }
    }
  end
end
