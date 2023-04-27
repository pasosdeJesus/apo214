# frozen_string_literal: true

require "apo214/concerns/models/disposicioncadaveres"

module Apo214
  class Disposicioncadaveres < ActiveRecord::Base
    include Apo214::Concerns::Models::Disposicioncadaveres
  end
end
