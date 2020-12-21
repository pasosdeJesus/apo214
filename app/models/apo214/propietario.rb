# encoding: UTF-8

require 'apo214/concerns/models/propietario'
module Apo214
  class Propietario < ActiveRecord::Base
    include Apo214::Concerns::Models::Propietario
  end
end
