require 'apo214/concerns/models/tipoentierro'

module Apo214
  class Tipoentierro < ActiveRecord::Base
    include Apo214::Concerns::Models::Tipoentierro
  end
end
