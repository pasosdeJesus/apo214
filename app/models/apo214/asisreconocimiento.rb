# encoding: UTF-8

require 'apo214/concerns/models/asisreconocimiento.rb'

module Apo214
  class Asisreconocimiento < ActiveRecord::Base
    include Apo214::Concerns::Models::Asisreconocimiento
  end
end
