# frozen_string_literal: true

require_relative "boot"

require "rails"
# Elige los marcos de trabajo que necesitas:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
# require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
require "action_view/railtie"
# require "action_cable/engine"
require "rails/test_unit/railtie"


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

require "heb412_gen"

module Apo214Demo
  class Application < Rails::Application
    config.load_defaults Rails::VERSION::STRING.to_f 

    config.time_zone = "America/Bogota"

    config.i18n.default_locale = :es

    config.active_record.schema_format = :sql

    config.railties_order = [
      :main_app,
      Apo214::Engine,
      Sivel2Gen::Engine,
      Heb412Gen::Engine,
      Mr519Gen::Engine,
      Msip::Engine,
      :all,
    ]

    config.x.formato_fecha = (ENV["MSIP_FORMATO_FECHA"] ||
                              "yyyy-mm-dd")

    config.x.heb412_ruta = (ENV["HEB412_RUTA"] ||
                            Rails.public_path.join("heb412"))

    config.relative_url_root = ENV.fetch(
      "RUTA_RELATIVA", "/apo214"
    )
    config.hosts.concat(
      ENV.fetch("CONFIG_HOSTS", "defensor.info").downcase.split(";"),
    )

    # config.web_console.whitelisted_ips = '190.27.122.155'
  end
end
