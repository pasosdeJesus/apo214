# encoding: UTF-8

require 'apo214/version'

Sip.setup do |config|
      config.ruta_anexos = "#{Rails.root}/archivos/"
      config.ruta_volcados = "#{Rails.root}/archivos/bd"
      # En heroku los anexos son super-temporales
      if !ENV["HEROKU_POSTGRESQL_GREEN_URL"].nil?
        config.ruta_anexos = "#{Rails.root}/tmp/"
      end
      config.titulo = "Apo214 " + Apo214::VERSION
end
