# encoding: UTF-8
module Apo214
  module Concerns
    module Models
      module Cobertura
        extend ActiveSupport::Concern

        included do
          include Sip::Basica
        end # included

      end
    end
  end
end
