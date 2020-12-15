# encoding: UTF-8
module Apo214
  module Concerns
    module Controllers
      module LugarespreliminaresController
        extend ActiveSupport::Concern

        included do
          # Los siguientes deben ir en clase que incluya esta modulo
          #before_action :set_lugarpreliminar,
          #    only: [:show, :edit, :update, :destroy]
          #load_and_authorize_resource class: Apo214::Lugarpreliminar,
          #  except: [:index, :show]
          helper Sip::UbicacionHelper
         
          def registrar_en_bitacora
            true
          end
          
          def clase
            'Apo214::Lugarpreliminar'
          end
          
          def lista_params 
            [ :codigositio,
              :detallesasesinato,
              :depositados,
              :fecha,
              :fechadis,
              :grabacion,
              :horadis,
              :id,
              :insitu,
              :nombreusuario,
              :disposicioncadaveres_id,
              :hechos,
              :max_depositados,
              :min_depositados,
              :nomcomoseconoce,
              :organizacion,
              :otradisposicioncadaveres,
              :otrotipotestigo,
              :parentezco,
              :telefono,
              :tipotestigo_id,
              :tipoentierro_id,
              :ubicacionpre_id,
              :otrolubicacionpre_id,
              :ubicacionpre_texto,
              :ubicacionpre_mundep_texto,
              :otrolubicacionpre_texto,
              :ubicaespecifica,
              :id_persona,
              :listadepositados_attributes => [
                :id,
                :_destroy,
                :personadepositada_attributes => [
                  :apellidos, 
                  :id, 
                  :nombres, 
                  :numerodocumento, 
                  :sexo, 
                  :tdocumento_id,
                  :anionac,
                  :mesnac,
                  :dianac
                ]
              ],
              :persona_attributes => [
                :anionac,
                :apellidos,
                :dianac,
                :id,
                :id_pais,
                :id_departamento,
                :id_municipio,
                :id_clase,
                :mesnac,
                :nombres,
                :nacionalde,
                :numerodocumento,
                :sexo,
                :tdocumento_id
              ]
            ]
          end

          def atributos_index
            [ :id,
              :fecha,
              :codigositio,
              :nombreusuario,
              :organizacion,
              :ubicacionpre_id
            ]
          end

          def genclase
            'M'
          end

          def atributos_show
            atributos_index +
            [
              # Otras
              :created_at,
              :updated_at
            ]
          end

          def new
            @registro = @lugarpreliminar = Apo214::Lugarpreliminar.new
            @registro.save!(validate: false)
            redirect_to apo214.edit_lugarpreliminar_path(@registro)
          end

          def update
            # Ubicamos los de autocompletacion y para esos creamos un registro 
            if lugarpreliminar_params && 
                lugarpreliminar_params[:persona_attributes][:id].to_i > 0 &&
                Sip::Persona.where(
                  id: lugarpreliminar_params[:persona_attributes][:id].to_i).count == 1
              @lugarpreliminar.id_persona = lugarpreliminar_params[:persona_attributes][:id]
            
              @lugarpreliminar.save!(validate: false)
            end
            if lugarpreliminar_params[:listadepositados_attributes]
              lugarpreliminar_params[:listadepositados_attributes].each do |a|
                # Ubicamos los de autocompletacion y para esos creamos un registro 
                if a[1] && a[1][:id] && a[1][:id] == '' && 
                    a[1][:personadepositada_attributes] && 
                    a[1][:personadepositada_attributes][:id] &&
                    a[1][:personadepositada_attributes][:id].to_i > 0 &&
                    Sip::Persona.where(
                      id: a[1][:personadepositada_attributes][:id].to_i).count == 1
                  ld = Apo214::Listadepostidos.create({
                    lugarpreliminar_id: @lugarpeliminar.id,
                    persona_id: a[1][:personadepositada_attributes][:id]
                  })
                  ld.save!(validate: false)
                  params[:lugarepliminar][:listadepositados_attributes][a[0].to_s][:id] = ld.id
                end
              end
            end
            update_gen
          end

          def new_modelo_path(o)
            return new_lugarpreliminar_path()
          end

          def vistas_manejadas
             return ['Lugarpreliminar']
          end
          
          private

          def set_lugarpreliminar
            @registro = @basica = @lugarpreliminar = 
              Apo214::Lugarpreliminar.find(
                Lugarpreliminar.connection.quote_string(params[:id]).to_i
            )
          end

          # No confiar parametros a Internet, sólo permitir lista blanca
          def lugarpreliminar_params
            params.require(:lugarpreliminar).permit(lista_params)

          end
        end
      end
    end
  end
end
