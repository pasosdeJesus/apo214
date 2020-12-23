# encoding: UTF-8

require 'apo214/concerns/models/listaevariesgo.rb'

module Apo214
  class Listaevariesgo < ActiveRecord::Base
    include Apo214::Concerns::Models::Listaevariesgo
  end
end
