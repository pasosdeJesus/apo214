# encoding: UTF-8
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
            [ :organizacion,
              :asistente_attributes => [
                  :apellidos, 
                  :id, 
                  :nombres,
                  :sexo
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
            @asisreconocimiento = @lugarpreliminar.asisreconocimientos.new
          end

          # POST /asisreconocimiento
          def create
            @asisreconocimiento = @lugarpreliminar.asisreconocimientos.create!(asisreconocimiento_params)
            respond_to do |format|
                format.turbo_stream
                format.html { redirect_to @lugarpreliminar }
            end
            actualiza_posicion
          end

          def actualiza_posicion
            @lugarpreliminar.asisreconocimientos.order(:position).each_with_index do |asis, indice|
              asis.position = indice+1
              asis.save!
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
              end
            end
          end

          def destroy
            @asisreconocimiento = @lugarpreliminar.asisreconocimientos.find(params[:id])
            @asisreconocimiento.destroy!
            respond_to do |format|
              format.turbo_stream { render turbo_stream: turbo_stream.remove(@asisreconocimiento) }
              format.html { redirect_to @lugarpreliminar.asisreconocimientos }
            end
            actualiza_posicion
          end

          def mover
            nueva = params[:nuevaposicion].to_i
            vieja = params[:viejaposicion].to_i
            if nueva < vieja
              [*nueva..(vieja-1)].each do |pos|
                asis = @lugarpreliminar.asisreconocimientos.where(position: pos)[0]
                asis.position = pos + 1
                asis.save!
              end
            else
              [*(vieja+1)..nueva].each do |pos|
                asis = @lugarpreliminar.asisreconocimientos.where(position: pos)[0]
                asis.position = pos + -1
                asis.save!
              end
            end
            @asisreconocimiento.insert_at(nueva)
            actualiza_posicion
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
