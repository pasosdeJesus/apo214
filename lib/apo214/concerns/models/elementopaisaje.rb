module Apo214
  module Concerns
    module Models
      module Elementopaisaje
        extend ActiveSupport::Concern

        included do
          include Msip::Basica
        end # included

      end
    end
  end
end
