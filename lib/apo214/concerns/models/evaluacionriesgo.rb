# frozen_string_literal: true

require "apo214/concerns/models/evaluacionriesgo"

module Apo214
  module Concerns
    module Models
      module Evaluacionriesgo
        extend ActiveSupport::Concern

        included do
          belongs_to :riesgo,
            class_name: "Apo214::Riesgo",
            optional: true
          validates :calificacion,
            numericality: { less_than_or_equal_to: 5, greater_than_or_equal_to: 1 },
            allow_nil: true
        end
      end
    end
  end
end
