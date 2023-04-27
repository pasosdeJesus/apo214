# frozen_string_literal: true

require "apo214/concerns/models/infoanomalia"

module Apo214
  class Infoanomalia < ActiveRecord::Base
    include Apo214::Concerns::Models::Infoanomalia
  end
end
