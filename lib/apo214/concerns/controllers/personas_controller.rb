# frozen_string_literal: true

require "sivel2_gen/concerns/controllers/personas_controller"
require "date"

module Apo214
  module Concerns
    module Controllers
      module PersonasController
        extend ActiveSupport::Concern

        included do
          include Sivel2Gen::Concerns::Controllers::PersonasController

          # Están llenas @persona, @victima, @personaant, @caso
          # Y está listo para salvar la nueva persona @persona en
          # @victima --remplazando @personaant.
          # Continúa si esta función retorna true, de lo contrario
          # se espera que la función haga render json con el error
          # y que retorne false.

          def atributos_show_apo214
            atributos_show_msip + [:lugarpreliminar_ids]
          end

          def atributos_show
            atributos_show_apo214
          end

          def atributos_form
            atributos_show - [:id, :lugarpreliminar_ids]
          end

          def atributos_index
            atributos_show - [:lugarpreliminar_ids]
          end

          def remplazar_antes_salvar_v
            true
          end

          def remplazar_despues_salvar_v
            true
          end

          def remplazaraportante
            @persona = Msip::Persona.find(params[:persona_id].to_i)
            respond_to do |format|
              format.html {
                render("/apo214/lugarespreliminares/remplazarpersona",
                       layout: false)
                return
              }
            end
          end

          def remplazardepositado
            id_listadepositado = params[:id_listadepositado]
            @listadepositado = id_listadepositado
            @persona = Msip::Persona.find(params[:persona_id])
            respond_to do |format|
              format.html {
                render("/msip/personas/remplazardepositado",
                       layout: false)
                return
              }
            end
          end

          def remplazarotrafuente
            id_otrafuente = params[:id_listapersonafuente]
            @listapersonafuente = id_otrafuente
            @persona = Msip::Persona.find(params[:persona_id])
            respond_to do |format|
              format.html {
                render("/msip/personas/remplazarotrafuente",
                       layout: false)
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
