# frozen_string_literal: true

require "apo214/concerns/models/listasuelo.rb"

module Apo214
  class Listasuelo < ActiveRecord::Base
    include Apo214::Concerns::Models::Listasuelo
  end
end
