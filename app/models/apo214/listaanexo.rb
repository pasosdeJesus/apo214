require 'apo214/concerns/models/listaanexo.rb'

module Apo214
  class Listaanexo < ActiveRecord::Base
    include Apo214::Concerns::Models::Listaanexo
  end
end
