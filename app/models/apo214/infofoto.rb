require 'apo214/concerns/models/infofoto'

module Apo214
  class Infofoto < ActiveRecord::Base
    include Apo214::Concerns::Models::Infofoto
  end
end
