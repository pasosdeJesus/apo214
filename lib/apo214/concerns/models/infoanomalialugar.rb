module Apo214
  module Concerns
    module Models
      module Infoanomalialugar
        extend ActiveSupport::Concern

        included do
          include Msip::Modelo 

          belongs_to :lugarpreliminar, class_name: 'Apo214::Lugarpreliminar',
            validate: true, foreign_key: 'lugarpreliminar_id', optional: false
          belongs_to :infoanomalia, class_name: 'Apo214::Infoanomalia', 
            validate: true, optional: false,
            foreign_key: 'infoanomalia_id'
          accepts_nested_attributes_for :infoanomalia, reject_if: :all_blank

        end # included
      end
    end
  end
end
