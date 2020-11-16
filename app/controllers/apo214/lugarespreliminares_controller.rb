# encoding: UTF-8

require 'apo214/concerns/controllers/lugarespreliminares_controller'

module Apo214
  class LugarespreliminaresController < Sip::ModelosController 

    include Apo214::Concerns::Controllers::LugarespreliminaresController
    before_action :set_lugarpreliminar,
        only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource class: Apo214::Lugarpreliminar,
      except: [:index, :show, :update]
  end
end
