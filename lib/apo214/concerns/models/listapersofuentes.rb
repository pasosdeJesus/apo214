module Apo214
  module Concerns
    module Models
      module Listapersofuentes
        extend ActiveSupport::Concern

        included do
          include Sip::Modelo 

          belongs_to :lugarpreliminar, class_name: 'Apo214::Lugarpreliminar',
            validate: true, foreign_key: 'lugarpreliminar_id', optional: false
          belongs_to :personafuente, class_name: 'Sip::Persona', 
            validate: true, foreign_key: 'persona_id', optional: false
          accepts_nested_attributes_for :personafuente, reject_if: :all_blank

        end # included
      end
    end
  end
end
