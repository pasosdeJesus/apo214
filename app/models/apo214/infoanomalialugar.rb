# frozen_string_literal: true

require "apo214/concerns/models/infoanomalialugar.rb"

module Apo214
  class Infoanomalialugar < ActiveRecord::Base
    include Apo214::Concerns::Models::Infoanomalialugar
  end
end
