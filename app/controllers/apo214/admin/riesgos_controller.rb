# encoding: UTF-8
module Apo214
  module Admin
    class RiesgosController < Sip::Admin::BasicasController
      before_action :set_riesgo, 
        only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource  class: Apo214::Riesgo

      def clase 
        "Apo214::Riesgo"
      end

      def set_riesgo
        @basica = Apo214::Riesgo.find(params[:id])
      end

      def atributos_index
        [
          :id, 
          :nombre, 
          :observaciones, 
          :fechacreacion_localizada, 
          :habilitado
        ]
      end

      def genclase
        'M'
      end

      def riesgo_params
        params.require(:riesgo).permit(*atributos_form)
      end

    end
  end
end
