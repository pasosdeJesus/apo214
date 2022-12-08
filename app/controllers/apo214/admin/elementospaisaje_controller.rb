module Apo214
  module Admin
    class ElementospaisajeController < Msip::Admin::BasicasController
      before_action :set_elementopaisaje, 
        only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource  class: Apo214::Elementopaisaje

      def clase 
        "Apo214::Elementopaisaje"
      end

      def set_elementopaisaje
        @basica = Apo214::Elementopaisaje.find(params[:id])
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

      def elementopaisaje_params
        params.require(:elementopaisaje).permit(*atributos_form)
      end

    end
  end
end
