# frozen_string_literal: true

module Apo214
  module Concerns
    module Models
      module Propietario
        extend ActiveSupport::Concern

        include Msip::Modelo
        include Msip::Localizacion

        included do
          # En el orden de esquema en base
          belongs_to :lugarpreliminar,
            validate: true,
            class_name: "Apo214::Lugarpreliminar",
            optional: false
          belongs_to :personapropietario,
            foreign_key: "persona_id",
            validate: false,
            class_name: "Msip::Persona",
            optional: false
          accepts_nested_attributes_for :personapropietario, reject_if: :all_blank

          validates_length_of :observaciones, maximum: 5000
        end
      end
    end
  end
end
