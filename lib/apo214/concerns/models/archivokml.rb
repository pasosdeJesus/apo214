# encoding: UTF-8

require 'sip/concerns/models/anexo'

module Apo214
  module Concerns
    module Models
      module Archivokml
        extend ActiveSupport::Concern
        include Sip::Concerns::Models::Anexo

        included do
          has_one :lugarpreliminar, foreign_key: "archivokml_id", 
            validate: true, class_name: 'Apo214::Lugarpreliminar'
        end

        module ClassMethods
        end

      end
    end
  end
end
