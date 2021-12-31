module Apo214
  module Concerns
    module Models
      module Listaanexo
        extend ActiveSupport::Concern

        included do
          include Sip::Modelo 

          belongs_to :lugarpreliminar, class_name: 'Apo214::Lugarpreliminar',
            validate: true, foreign_key: 'lugarpreliminar_id', optional: false
          belongs_to :sip_anexo, class_name: 'Sip::Anexo', validate: true,
            foreign_key: 'anexo_id', optional: false
          accepts_nested_attributes_for :sip_anexo, reject_if: :all_blank

        end # included
      end
    end
  end
end
