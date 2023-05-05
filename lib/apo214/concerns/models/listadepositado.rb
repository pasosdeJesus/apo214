# frozen_string_literal: true

module Apo214
  module Concerns
    module Models
      module Listadepositado
        extend ActiveSupport::Concern

        included do
          include Msip::Modelo

          belongs_to :lugarpreliminar,
            class_name: "Apo214::Lugarpreliminar",
            validate: true,
            optional: false
          belongs_to :personadepositada,
            class_name: "Msip::Persona",
            validate: true,
            optional: false,
            foreign_key: "persona_id"
          accepts_nested_attributes_for :personadepositada, reject_if: :all_blank
        end # included
      end
    end
  end
end
