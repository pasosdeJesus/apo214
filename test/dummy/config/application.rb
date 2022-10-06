require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

require 'heb412_gen'

module Apo214Demo
  class Application < Rails::Application
    config.load_defaults 7.0

    config.time_zone = 'America/Bogota'

    config.i18n.default_locale = :es

    config.active_record.schema_format = :sql

    config.x.formato_fecha = (ENV['SIP_FORMATO_FECHA'] ||
                              'yyyy-mm-dd')

    config.x.heb412_ruta = (ENV['HEB412_RUTA'] ||
                            Rails.root.join('public', 'heb412'))

    config.hosts.concat(
      ENV.fetch('CONFIG_HOSTS', 'defensor.info').downcase.split(";"))


    #config.web_console.whitelisted_ips = '190.27.122.155'
  end
end
