require 'apo214/concerns/models/listapersofuentes.rb'

module Apo214
  class Listapersofuentes < ActiveRecord::Base
    include Apo214::Concerns::Models::Listapersofuentes
  end
end
