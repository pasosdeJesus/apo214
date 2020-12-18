# encoding: UTF-8

module Apo214
  module Concerns
    module Models
      module LugarpreliminarRiesgo
        extend ActiveSupport::Concern

        included do
          belongs_to :apo214_lugarpreliminar, foreign_key: "lugarpreliminar_id", validate: true
          belongs_to :apo214_riesgo, foreign_key: "riesgo_id", validate: true
        end
      end
    end
  end
end
