# encoding: UTF-8
module Apo214
  module Concerns
    module Models
      module Riesgo
        extend ActiveSupport::Concern

        included do
          include Sip::Basica

          has_many :lugarpreliminar_riesgo, 
            foreign_key: "riesgo_id", validate: true, 
            class_name: 'Apo214::LugarpreliminarRiesgo'
          has_many :lugarpreliminar, through: :lugarpreliminar_riesgo, class_name: 'Apo214::Lugarpreliminar'
        end # included

      end
    end
  end
end
