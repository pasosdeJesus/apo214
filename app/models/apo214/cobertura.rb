# frozen_string_literal: true

require "apo214/concerns/models/cobertura"

module Apo214
  class Cobertura < ActiveRecord::Base
    include Apo214::Concerns::Models::Cobertura
  end
end
