# frozen_string_literal: true

require "apo214/concerns/models/listapersonafuente.rb"

module Apo214
  class Listapersonafuente < ActiveRecord::Base
    include Apo214::Concerns::Models::Listapersonafuente
  end
end
