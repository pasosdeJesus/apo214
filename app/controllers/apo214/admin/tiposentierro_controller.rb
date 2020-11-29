# encoding: UTF-8

module Apo214
  module Admin
    class TiposentierroController < Sip::Admin::BasicasController
      before_action :set_tipoentierro, 
        only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource  class: Apo214::Tipoentierro

      def clase 
        "Apo214::Tipoentierro"
      end

      def set_tipoentierro
        @basica = Apo214::Tipoentierro.find(params[:id])
      end

      def genclase
        'M'
      end

      def tipoentierro_params
        params.require(:tipoentierro).permit(*atributos_form)
      end

    end
  end
end
