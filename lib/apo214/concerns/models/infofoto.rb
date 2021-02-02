require 'apo214/concerns/models/infofoto'

module Apo214
  module Concerns
    module Models
      module Infofoto
        extend ActiveSupport::Concern

        included do

          validates_length_of :fotografia, maximum: 5000
        end

      end
    end
  end
end

