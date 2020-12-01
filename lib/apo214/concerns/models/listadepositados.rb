module Apo214
  module Concerns
    module Models
      module Listadepositados
        extend ActiveSupport::Concern

        included do
          include Sip::Modelo 

          belongs_to :lugarpreliminar, class_name: 'Apo214::Lugarpreliminar',
            validate: true, foreign_key: 'lugarpreliminar_id'
          belongs_to :personadepositada, class_name: 'Sip::Persona', validate: true,
            foreign_key: 'persona_id'
          accepts_nested_attributes_for :personadepositada, reject_if: :all_blank

          validates :actividad, presence: true
          validates :persona, presence: true

        end # included
      end
    end
  end
end
