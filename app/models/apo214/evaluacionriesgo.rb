require 'apo214/concerns/models/evaluacionriesgo'

module Apo214
  class Evaluacionriesgo < ActiveRecord::Base
    include Apo214::Concerns::Models::Evaluacionriesgo
  end
end
