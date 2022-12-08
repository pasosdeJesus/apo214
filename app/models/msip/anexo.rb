require 'apo214/concerns/models/anexo'

module Msip
  class Anexo < ActiveRecord::Base
    include Apo214::Concerns::Models::Anexo
  end
end
