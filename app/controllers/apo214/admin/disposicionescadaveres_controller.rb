# frozen_string_literal: true

module Apo214
  module Admin
    class DisposicionescadaveresController < Msip::Admin::BasicasController
      before_action :set_disposicioncadaveres,
        only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Apo214::Disposicioncadaveres

      def clase
        "Apo214::Disposicioncadaveres"
      end

      def set_disposicioncadaveres
        @basica = Disposicioncadaveres.find(params[:id])
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
        "F"
      end

      def disposicioncadaveres_params
        params.require(:disposicioncadaveres).permit(*atributos_form)
      end
    end
  end
end
