# frozen_string_literal: true

module Apo214
  module Admin
    class CoberturasController < Msip::Admin::BasicasController
      before_action :set_cobertura,
        only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Apo214::Cobertura

      def clase
        "Apo214::Cobertura"
      end

      def set_cobertura
        @basica = Apo214::Cobertura.find(params[:id])
      end

      def atributos_index
        [
          :id,
          :nombre,
          :observaciones,
          :fechacreacion_localizada,
          :habilitado,
        ]
      end

      def genclase
        "M"
      end

      def cobertura_params
        params.require(:cobertura).permit(*atributos_form)
      end
    end
  end
end
