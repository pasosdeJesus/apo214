module Apo214
  module Concerns
    module Models
      module Listaevariesgo
        extend ActiveSupport::Concern

        included do
          include Sip::Modelo 

          belongs_to :lugarpreliminar, class_name: 'Apo214::Lugarpreliminar',
            validate: true, foreign_key: 'lugarpreliminar_id', optional: false
          belongs_to :evaluacionriesgo, class_name: 'Apo214::Evaluacionriesgo',
            validate: true, foreign_key: 'evaluacionriesgo_id', 
            optional: false
          accepts_nested_attributes_for :evaluacionriesgo, reject_if: :all_blank

        end # included
      end
    end
  end
end
