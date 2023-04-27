# frozen_string_literal: true

require "apo214/concerns/models/listainfofoto.rb"

module Apo214
  class Listainfofoto < ActiveRecord::Base
    include Apo214::Concerns::Models::Listainfofoto
  end
end
