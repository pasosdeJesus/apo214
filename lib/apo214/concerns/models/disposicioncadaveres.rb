module Apo214
  module Concerns
    module Models
      module Disposicioncadaveres
        extend ActiveSupport::Concern

        included do
          include Sip::Basica
        end # included

      end
    end
  end
end
