require 'apo214/concerns/models/elementopaisaje'

module Apo214
  class Elementopaisaje < ActiveRecord::Base
    include Apo214::Concerns::Models::Elementopaisaje
  end
end
