require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module BaseApi
  class Application < Rails::Application
    config.load_defaults 7.0
    config.time_zone = "Hanoi"
    config.api_only = true
  end
end
