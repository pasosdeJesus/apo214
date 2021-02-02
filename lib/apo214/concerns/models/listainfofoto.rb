module Apo214
  module Concerns
    module Models
      module Listainfofoto
        extend ActiveSupport::Concern

        included do
          include Sip::Modelo 

          belongs_to :lugarpreliminar, class_name: 'Apo214::Lugarpreliminar',
            validate: true, foreign_key: 'lugarpreliminar_id'
          belongs_to :infofoto, class_name: 'Apo214::Infofoto', validate: true,
            foreign_key: 'infofoto_id'
          accepts_nested_attributes_for :infofoto, reject_if: :all_blank

        end # included
      end
    end
  end
end
