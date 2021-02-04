# encoding: UTF-8

require 'apo214/concerns/models/listaanexos.rb'

module Apo214
  class Listaanexos < ActiveRecord::Base
    include Apo214::Concerns::Models::Listaanexos
  end
end
