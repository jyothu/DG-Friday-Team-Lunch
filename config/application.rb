require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DGFridayTeamLunch
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.generators do |g|
      g.fixture_replacement :factory_girl, dir: 'spec/factories', suffix: 'factory'
      g.helper false
      g.helper_specs false
      g.test_framework :rspec
      g.view_specs false
    end
  end
end
