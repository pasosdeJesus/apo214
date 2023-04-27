# frozen_string_literal: true

module Apo214
  module Concerns
    module Models
      module Infoanomalialugar
        extend ActiveSupport::Concern

        included do
          include Msip::Modelo

          belongs_to :lugarpreliminar,
            class_name: "Apo214::Lugarpreliminar",
            validate: true,
            optional: false
          belongs_to :infoanomalia,
            class_name: "Apo214::Infoanomalia",
            validate: true,
            optional: false
          accepts_nested_attributes_for :infoanomalia, reject_if: :all_blank
        end # included
      end
    end
  end
end
