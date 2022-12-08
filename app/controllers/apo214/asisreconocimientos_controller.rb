require 'apo214/concerns/controllers/asisreconocimientos_controller'

module Apo214
  class AsisreconocimientosController < Msip::ModelosController 

    before_action :set_lugarpreliminar
    load_and_authorize_resource class: Apo214::Asisreconocimiento,
      except: [:index, :show, :update]
    include Apo214::Concerns::Controllers::AsisreconocimientosController
  end
end
