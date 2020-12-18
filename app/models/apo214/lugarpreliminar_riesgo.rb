require 'apo214/concerns/models/lugarpreliminar_riesgo'

module Apo214
  class LugarpreliminarRiesgo < ActiveRecord::Base
    include Apo214::Concerns::Models::LugarpreliminarRiesgo
  end
end
