require 'apo214/concerns/models/suelo'

module Apo214
  class Suelo < ActiveRecord::Base
    include Apo214::Concerns::Models::Suelo
  end
end
