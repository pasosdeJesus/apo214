# frozen_string_literal: true

module Apo214
  module Concerns
    module Models
      module Listapersonafuente
        extend ActiveSupport::Concern

        included do
          include Msip::Modelo

          belongs_to :lugarpreliminar,
            class_name: "Apo214::Lugarpreliminar",
            validate: true,
            optional: false
          belongs_to :personafuente,
            class_name: "Msip::Persona",
            validate: true,
            foreign_key: "persona_id",
            optional: false
          accepts_nested_attributes_for :personafuente, reject_if: :all_blank
        end # included
      end
    end
  end
end
