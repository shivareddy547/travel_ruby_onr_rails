require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BookingEngine
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.autoload_paths << "#{Rails.root}/lib"

    config.autoload_paths += [Rails.root.join('app', 'validators').to_s]

    config.eager_load = false
    config.autoload_once_paths += Dir["#{config.root}/lib/", "#{config.root}/lib/controllers/**/", "#{config.root}/lib/api/**/"]
    config.eager_load_paths += Dir["#{config.root}/lib/", "#{config.root}/lib/controllers/**/", "#{config.root}/lib/api/**/"]

    config.action_dispatch.default_headers = {
        'Access-Control-Allow-Origin' => '*',
        'Access-Control-Request-Method' => %w{GET POST OPTIONS}.join(",")
    }
    # config.api_only = true

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :options]
      end
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
