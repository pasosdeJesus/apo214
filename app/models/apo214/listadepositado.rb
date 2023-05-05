# frozen_string_literal: true

require "apo214/concerns/models/listadepositado.rb"

module Apo214
  class Listadepositado < ActiveRecord::Base
    include Apo214::Concerns::Models::Listadepositado
  end
end
