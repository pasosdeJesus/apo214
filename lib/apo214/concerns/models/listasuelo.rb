# frozen_string_literal: true

module Apo214
  module Concerns
    module Models
      module Listasuelo
        extend ActiveSupport::Concern

        included do
          include Msip::Modelo

          belongs_to :lugarpreliminar,
            class_name: "Apo214::Lugarpreliminar",
            validate: true,
            optional: false
          belongs_to :suelo,
            class_name: "Apo214::Suelo",
            validate: true,
            optional: false
          accepts_nested_attributes_for :suelo, reject_if: :all_blank
        end # included
      end
    end
  end
end
