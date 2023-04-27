# frozen_string_literal: true

require "date"
require "apo214/concerns/controllers/personas_controller"

module Msip
  class PersonasController < Msip::ModelosController
    load_and_authorize_resource class: Msip::Persona
    include Apo214::Concerns::Controllers::PersonasController
  end
end
