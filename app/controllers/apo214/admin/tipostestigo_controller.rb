module Apo214
  module Admin
    class TipostestigoController < Sip::Admin::BasicasController
      before_action :set_tipotestigo, 
        only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource  class: Apo214::Tipotestigo
  
      def clase 
        "Apo214::Tipotestigo"
      end
  
      def set_tipotestigo
        @basica = Tipotestigo.find(params[:id])
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
  
      def tipotestigo_params
        params.require(:tipotestigo).permit(*atributos_form)
      end
  
    end
  end
end
