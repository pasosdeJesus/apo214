require 'date'
require 'apo214/concerns/controllers/personas_controller' 

module Apo214
  class PersonasController < Sip::ModelosController

    load_and_authorize_resource class: Sip::Persona
    include Apo214::Concerns::Controllers::PersonasController
  end
end
