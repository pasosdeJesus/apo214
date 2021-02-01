require 'apo214/concerns/models/infoanomalia'

module Apo214
  module Concerns
    module Models
      module Infoanomalia
        extend ActiveSupport::Concern

        included do
          validates :latitud, :inclusion => {in: -90..90, message: 'El valor de la latitud debe ser entre -90 y 90'}
          validates :longitud, :inclusion => {in: -180..180, message: 'El valor de longitud debe ser entre -180 y 180'}
        end

      end
    end
  end
end

