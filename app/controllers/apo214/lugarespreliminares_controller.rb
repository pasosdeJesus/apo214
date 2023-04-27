# frozen_string_literal: true

require "apo214/concerns/controllers/lugarespreliminares_controller"

module Apo214
  class LugarespreliminaresController < Msip::ModelosController
    before_action :set_lugarpreliminar,
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource class: Apo214::Lugarpreliminar
    include Apo214::Concerns::Controllers::LugarespreliminaresController
  end
end
