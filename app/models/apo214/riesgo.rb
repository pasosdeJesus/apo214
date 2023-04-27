# frozen_string_literal: true

require "apo214/concerns/models/riesgo"

module Apo214
  class Riesgo < ActiveRecord::Base
    include Apo214::Concerns::Models::Riesgo
  end
end
