# frozen_string_literal: true

require "apo214/version"

Msip.setup do |config|
  config.ruta_anexos = (ENV["MSIP_RUTA_ANEXOS"] ||
                        "#{Rails.root}/archivos/anexos")
  config.ruta_volcados = (ENV["MSIP_RUTA_VOLCADOS"] ||
                          "#{Rails.root}/archivos/bd")
  # En heroku los anexos son super-temporales
  unless ENV["HEROKU_POSTGRESQL_GREEN_URL"].nil?
    config.ruta_anexos = "#{Rails.root}/tmp/"
  end
  config.titulo = "Apo214 " + Apo214::VERSION
end
