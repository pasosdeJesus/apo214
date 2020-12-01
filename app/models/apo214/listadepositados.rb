# encoding: UTF-8

require 'apo214/concerns/models/listadepositados.rb'

module Apo214
  class Listadepositados < ActiveRecord::Base
    include Apo214::Concerns::Models::Listadepositados
  end
end
