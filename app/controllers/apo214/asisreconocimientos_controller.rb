# encoding: UTF-8

require 'apo214/concerns/controllers/asisreconocimientos_controller'

module Apo214
  class AsisreconocimientosController < Sip::ModelosController 

    include Apo214::Concerns::Controllers::AsisreconocimientosController
    before_action :set_lugarpreliminar
    load_and_authorize_resource class: Apo214::Asisreconocimiento,
      except: [:index, :show, :update]
  end
end
