require 'apo214/concerns/models/infoanomalia'

module Apo214
  module Concerns
    module Models
      module Infoanomalia
        extend ActiveSupport::Concern

        included do
          include Sip::Modelo
          include Sip::Localizacion
          flotante_localizado :latitud 
          flotante_localizado :longitud

          ## Extras para conversión
          attr_accessor :latitud_wgs84
          attr_accessor :longitud_wgs84
          attr_accessor :latitud_sirgas
          attr_accessor :longitud_sirgas
          attr_accessor :cardinal_lat
          attr_accessor :gra_lat
          attr_accessor :min_lat
          attr_accessor :seg_lat
          attr_accessor :cardinal_lon
          attr_accessor :gra_lon
          attr_accessor :min_lon
          attr_accessor :seg_lon
          belongs_to :sip_anexo, class_name: 'Sip::Anexo', validate: true,
            foreign_key: 'anexo_id'
          accepts_nested_attributes_for :sip_anexo, reject_if: :all_blank
          validates :latitud, :inclusion => {in: -90..90, message: 'El valor de la latitud debe ser entre -90 y 90'}
          validates :longitud, :inclusion => {in: 0..180, message: 'El valor de longitud debe ser entre 0 y 180'}
        end

      end
    end
  end
end

