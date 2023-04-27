# frozen_string_literal: true

require "apo214/concerns/models/tipotestigo"

module Apo214
  class Tipotestigo < ActiveRecord::Base
    include Apo214::Concerns::Models::Tipotestigo
  end
end
