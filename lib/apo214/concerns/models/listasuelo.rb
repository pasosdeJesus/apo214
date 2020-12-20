module Apo214
  module Concerns
    module Models
      module Listasuelo
        extend ActiveSupport::Concern

        included do
          include Sip::Modelo 

          belongs_to :lugarpreliminar, class_name: 'Apo214::Lugarpreliminar',
            validate: true, foreign_key: 'lugarpreliminar_id'
          belongs_to :suelo, class_name: 'Apo214::Suelo', validate: true,
            foreign_key: 'suelo_id'
          accepts_nested_attributes_for :suelo, reject_if: :all_blank

        end # included
      end
    end
  end
end
