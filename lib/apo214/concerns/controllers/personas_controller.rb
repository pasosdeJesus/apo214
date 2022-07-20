
require 'sip/concerns/controllers/personas_controller'
require 'date'

module Apo214
  module Concerns
    module Controllers
      module PersonasController
        extend ActiveSupport::Concern

        included do
          include Sip::Concerns::Controllers::PersonasController
 
          # Están llenas @persona, @victima, @personaant, @caso
          # Y está listo para salvar la nueva persona @persona en
          # @victima --remplazando @personaant.
          # Continúa si esta función retorna true, de lo contrario
          # se espera que la función haga render json con el error
          # y que retorne false.
          def remplazar_antes_salvar_v
            true
          end 

          def remplazar_despues_salvar_v
            true
          end 

          def remplazar
            @persona = Sip::Persona.find(params[:id_persona])
            respond_to do |format|
              format.html { 
                render('/apo214/lugarespreliminares/remplazarpersona', layout: false)
                return
              }
            end
          end

          def remplazardepositado
            id_listadepositados= params[:id_listadepositados]
            @listadepositados= id_listadepositados
            @persona = Sip::Persona.find(params[:id_persona])
            respond_to do |format|
              format.html { 
                render('/apo214/lugarespreliminares/remplazardepositado', layout: false)
                return
              }
            end
          end

          def remplazarotrafuente
            id_otrafuente= params[:id_listapersofuentes]
            @listapersofuentes= id_otrafuente
            @persona = Sip::Persona.find(params[:id_persona])
            respond_to do |format|
              format.html { 
                render('/apo214/lugarespreliminares/remplazarotrafuente', layout: false)
                return
              }
            end
          end

        end # included


        class_methods do
        end # class_methods
      end
    end
  end
end
