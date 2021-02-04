# encoding: UTF-8

require 'sip/concerns/models/anexo'

module Apo214
  module Concerns
    module Models
      module Anexo
        extend ActiveSupport::Concern
        include Sip::Concerns::Models::Anexo

        included do
          has_many :infoanomalia, foreign_key: "anexo_id", 
            validate: true, class_name: 'Apo214::Infoanomalia'
        end

        module ClassMethods
        end

      end
    end
  end
end
