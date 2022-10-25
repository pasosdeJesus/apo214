module Apo214
  module Concerns
    module Controllers
      module AsisreconocimientosController
        extend ActiveSupport::Concern

        included do
          # Los siguientes deben ir en clase que incluya esta modulo
          #before_action :set_asisreconocimiento,
          #    only: [:show, :edit, :update, :destroy]
          #load_and_authorize_resource class: Apo214::Asisreconocimiento,
          #  except: [:index, :show]
          helper Sip::UbicacionHelper
          def registrar_en_bitacora
            true
          end

          def clase
            'Apo214::Asisreconocimiento'
          end

          def lista_params 
            [
              :organizacion,
              :persona_id,
              :asistente_attributes => [
                  :apellidos, 
                  :nombres,
                  :sexo,
                ]
            ]
          end

          def atributos_index
            [ :organizacion
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
            if params[:remplazarasistente]
              @persona = Sip::Persona.find(params[:id_persona])
              @lugarpreliminar = Apo214::Lugarpreliminar.
                find(params[:id_lugarpreliminar].to_i)
              @asisreconocimiento = @lugarpreliminar.asisreconocimientos.new
              #@asisreconocimiento.asistente = @persona
              #@asisreconocimiento.organizacion = ''
              #@asisreconocimiento.save! 
              respond_to do |format|
                format.html {
                  render("/apo214/lugarespreliminares/_form",
                         layout: false)
                }
                return
              end
            end
            @asisreconocimiento = @lugarpreliminar.asisreconocimientos.new
          end

          # POST /asisreconocimiento
          def create
            @asisreconocimiento = @lugarpreliminar.asisreconocimientos.new(asisreconocimiento_params)
            if params[:asisreconocimiento][:persona_id] != ""
              persona_id = params[:asisreconocimiento][:persona_id].to_i
              @asisreconocimiento.persona_id = persona_id
            end
            respond_to do |format|
              if @asisreconocimiento.save
                format.turbo_stream do
                  render turbo_stream: [
                    turbo_stream.append("asisreconocimientos", 
                                        partial: "apo214/asisreconocimientos/asisreconocimiento", 
                                        locals: {asisreconocimiento: @asisreconocimiento}) 
                  ]
                end
                
                format.html { redirect_to edit_lugarpreliminar_path(@lugarpreliminar) }
              else
                format.turbo_stream do
                  render turbo_stream: [
                    turbo_stream.update("new_asisreconocimiento", 
                                        partial: "apo214/asisreconocimientos/form", 
                                        locals: {asisreconocimiento: @asisreconocimiento})
                  ]
                end
                format.html { redirect_to edit_lugarpreliminar_path(@lugarpreliminar) }
              end
            end
          end

          def edit
            @lugarpreliminar = Apo214::Lugarpreliminar.find(params[:lugarpreliminar_id])
            @asisreconocimiento = @lugarpreliminar.asisreconocimientos.find(params[:id])
          end

          def update
            @asisreconocimiento = @lugarpreliminar.asisreconocimientos.find(params[:id])
            if @asisreconocimiento.update(asisreconocimiento_params)
              respond_to do |format|
                format.turbo_stream { render turbo_stream: turbo_stream.replace(@asisreconocimiento) }
                format.html { redirect_to @asisreconocimiento }
                format.json { render :json => @asisreconocimiento}
              end
            end
          end

          def destroy
            @asisreconocimiento = @lugarpreliminar.asisreconocimientos.find(params[:id])
            @asisreconocimiento.remove_from_list
            @asisreconocimiento.destroy!
            respond_to do |format|
              format.turbo_stream { render turbo_stream: turbo_stream.remove(@asisreconocimiento) }
              format.html { redirect_to @lugarpreliminar.asisreconocimientos }
            end
          end

          def mover
            asis = @asisreconocimiento
            todos = asis.lugarpreliminar.asisreconocimientos.count
            nueva = (todos + 1) - params[:posicion].to_i
            asis.insert_at(nueva)
            head :ok
          end
          private
          # Use callbacks to share common setup or constraints between actions.
          def set_lugarpreliminar
            @lugarpreliminar = Apo214::Lugarpreliminar.find(params[:lugarpreliminar_id])
          end

          # Only allow a list of trusted parameters through.
          def asisreconocimiento_params
            params.require(:asisreconocimiento).permit(lista_params)
          end

        end
      end
    end
  end
end
