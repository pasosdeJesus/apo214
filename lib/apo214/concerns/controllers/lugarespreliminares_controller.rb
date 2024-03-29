# frozen_string_literal: true

module Apo214
  module Concerns
    module Controllers
      module LugarespreliminaresController
        extend ActiveSupport::Concern

        included do
          # Los siguientes deben ir en clase que incluya esta modulo
          # before_action :set_lugarpreliminar,
          #    only: [:show, :edit, :update, :destroy]
          # load_and_authorize_resource class: Apo214::Lugarpreliminar,
          #  except: [:index, :show]
          helper Msip::UbicacionHelper

          def registrar_en_bitacora
            true
          end

          def clase
            "Apo214::Lugarpreliminar"
          end

          def lista_params
            [
              :accesolugar,
              :archivokml_id,
              :codigositio,
              :cobertura_id,
              :detallesdisposicion,
              :detallesasesinato,
              :depositados,
              :desgenanomalia,
              :disposicioncadaveres_id,
              :elementopaisaje_id,
              :evaluacionlugar,
              :fecha,
              :fechadis,
              :grabacion,
              :hechos,
              :horadis,
              :id,
              :persona_id,
              :insitu,
              :interatroprevias,
              :interatroactuales,
              :max_depositados,
              :min_depositados,
              :nombrepropiedad,
              :nombreusuario,
              :nomcomoseconoce,
              :observaciones,
              :organizacion,
              :otradisposicioncadaveres,
              :otrotipotestigo,
              :parentezco,
              :perfilestratigrafico,
              :procesoscul,
              :riesgosdanios,
              :telefono,
              :tipotestigo_id,
              :tipoentierro_id,
              :ubicacionpre_id,
              :otrolubicacionpre_texto,
              :otrolubicacionpre_id,
              :ubicacionpre_centropoblado_id,
              :ubicacionpre_departamento_id,
              :ubicacionpre_latitud_localizado,
              :ubicacionpre_longitud_localizado,
              :ubicacionpre_lugar,
              :ubicacionpre_municipio_id,
              :ubicacionpre_pais_id,
              :ubicacionpre_sitio,
              :ubicacionpre_tsitio_id,
              :usoterprevios,
              :usoteractuales,
              :ubicaespecifica,
              archivokml_attributes: [
                :id, :descripcion, :adjunto, :_destroy,
              ],
              infoanomalialugar_attributes: [
                :id,
                :_destroy,
                infoanomalia_attributes: [
                  :anomalia,
                  :descripcion,
                  :id,
                  :latitud_localizado,
                  :longitud_localizado,
                  :area,
                  :latitud_wgs84,
                  :longitud_wgs84,
                  :latitud_sirgas,
                  :longitud_sirgas,
                  :latitud_on,
                  :longitud_on,
                  :cardinal_lat,
                  :gra_lat,
                  :min_lat,
                  :seg_lat,
                  :cardinal_lon,
                  :gra_lon,
                  :min_lon,
                  :seg_lon,
                  msip_anexo_attributes: [
                    :id, :descripcion, :adjunto, :_destroy,
                  ],
                ],
              ],

              listaanexo_attributes: [
                :id,
                :lugarpreliminar_id,
                :fecha,
                :_destroy,
                msip_anexo_attributes: [
                  :id, :descripcion, :adjunto, :_destroy,
                ],
              ],
              listadepositado_attributes: [
                :id,
                :_destroy,
                personadepositada_attributes: [
                  :apellidos,
                  :id,
                  :nombres,
                  :numerodocumento,
                  :sexo,
                  :tdocumento_id,
                  :anionac,
                  :mesnac,
                  :dianac,
                ],
              ],
              listaevariesgo_attributes: [
                :id,
                :_destroy,
                evaluacionriesgo_attributes: [
                  :id,
                  :riesgo_id,
                  :calificacion,
                  :descripcion,
                ],
              ],
              listainfofoto_attributes: [
                :id,
                :lugarpreliminar_id,
                :fecha,
                :_destroy,
                msip_anexo_attributes: [
                  :id, :descripcion, :adjunto, :_destroy,
                ],
              ],
              listapersonafuente_attributes: [
                :id,
                :telefono,
                :observacion,
                :_destroy,
                personafuente_attributes: [
                  :apellidos,
                  :id,
                  :nombres,
                  :numerodocumento,
                  :sexo,
                  :tdocumento_id,
                  :anionac,
                  :mesnac,
                  :dianac,
                ],
              ],
              listasuelo_attributes: [
                :id,
                :_destroy,
                suelo_attributes: [
                  :color,
                  :humedad,
                  :id,
                  :profinicial,
                  :proffinal,
                  :textura,
                ],
              ],
              persona_attributes: [
                :anionac,
                :apellidos,
                :dianac,
                :id,
                :pais_id,
                :departamento_id,
                :municipio_id,
                :centropoblado_id,
                :mesnac,
                :nombres,
                :nacionalde,
                :numerodocumento,
                :sexo,
                :tdocumento_id,
              ],
              propietario_attributes: [
                :telefono,
                :observaciones,
                :id,
                :persona_id,
                :_destroy,
                personapropietario_attributes: [
                  :apellidos,
                  :id,
                  :nombres,
                  :numerodocumento,
                  :sexo,
                  :tdocumento_id,
                ],
              ],
              propietario_ids: [],
              msip_anexo_attributes: [
                :id, :descripcion, :adjunto, :_destroy,
              ],
            ]
          end

          def atributos_index
            [
              :id,
              :fecha,
              :codigositio,
              :nombreusuario,
              :organizacion,
            ]
          end

          def genclase
            "M"
          end

          def atributos_show
            atributos_index +
              [
                # Otras
                :created_at,
                :updated_at,
              ]
          end

          def coordenadas
            ## 3116 - magna-sirgas / colombia bogota zone
            ## 4326 - wgs84 / latitut longitud
            ## Tipos de conversión:
            ## 1: de wgs84 flotante a los demás
            ## 2: de wgs84 gms a los demás
            ## 3: de magna sirgas bogotá a los demas
            ## 4: de Origen nacional a los demás
            tipo = params[:tipo].to_i
            conversion = {}
            coor_gms = "4°0'0.000''N 73°0'0.000''W"
            coor_wgs84 = ["-73", "4"]
            coor_on = ["5000000", "2000000"]
            coor_sirgas = ["1119664.42733207", "934150.34391812"]
            mensaje_error = ""
            case tipo
            when 1
              lat_wgs84_flot = params[:lat_wgs84_flot].to_f.to_s
              lon_wgs84_flot = params[:lon_wgs84_flot].to_f.to_s
              punto = "POINT(" + lon_wgs84_flot + " " + lat_wgs84_flot + ")"
              consl_sirgas = "SELECT st_astext(st_transform( st_geometryfromtext('" + punto + "', 4326), 3116) );"
              consl_on = 'SELECT st_astext(st_transform( st_geometryfromtext(
              \'' + punto + '\', 4326 ), \'+proj=tmerc +ellps=GRS80 +lat_0=4
              +lon_0=-73 +k=0.9992 +x_0=5000000 +y_0=2000000 +units=m +no_defs\'
              ::text) );'
              resultado_sirgas = ActiveRecord::Base.connection.execute(consl_sirgas)
              resultado_on = ActiveRecord::Base.connection.execute(consl_on)
              if resultado_sirgas.getvalue(0, 0) == "POINT(inf inf)"
                mensaje_error = "Valor ingresado no permitido"
              else
                consl_gms = "SELECT (ST_AsLatLonText('" + punto + "', 'D°M''S.SSS''C'));"
                resultado_gms = ActiveRecord::Base.connection.execute(consl_gms)
                coor_wgs84 = punto.slice(6..-2).split(" ")
                coor_gms = resultado_gms.getvalue(0, 0)
                coor_on = resultado_on.getvalue(0, 0).slice(6..-2).split(" ")
                coor_sirgas = resultado_sirgas.getvalue(0, 0).slice(6..-2).split(" ")
              end
            when 2
              lat_gms = params[:lat_gms]
              lon_gms = params[:lon_gms]
            when 3
              lat_sirgas = params[:lat_sirgas].to_f
              lon_sirgas = params[:lon_sirgas].to_f
              unless lat_sirgas.is_a?(Numeric) && lon_sirgas.is_a?(Numeric)
                raise ArgumentError, "Valor de latitud o longitud inválida"
              end

              punto = "POINT(" + lon_sirgas.to_s + " " + lat_sirgas.to_s + ")"
              consl_wgs84 = "SELECT st_astext(st_transform(
                st_geometryfromtext(
                  #{ActiveRecord::Base.connection.quote(punto)}, 3116), 4326));"
              resultado_wgs84 = ActiveRecord::Base.connection
                .execute(consl_wgs84, punto)
              punto_wgs84 = resultado_wgs84.getvalue(0, 0)
              consl_on = "SELECT st_astext(st_transform(
                st_geometryfromtext(
                  #{ActiveRecord::Base.connection.quote(punto_wgs84)},
                  4326
                ),
                '+proj=tmerc +ellps=GRS80 +lat_0=4 +lon_0=-73 +k=0.9992
                 +x_0=5000000 +y_0=2000000 +units=m +no_defs' ::text
                ));"
              resultado_on = ActiveRecord::Base.connection.execute(
                consl_on,
                punto_wgs84,
              )
              coor_wgs84 = resultado_wgs84.getvalue(0, 0).slice(6..-2).split(" ")
              coor_on = resultado_on.getvalue(0, 0).slice(6..-2).split(" ")
              consl_gms = "SELECT (ST_AsLatLonText(
                #{ActiveRecord::Base.connection.quote(punto_wgs84)},
                  'D°M''S.SSS''C'));"
              resultado_gms = ActiveRecord::Base.connection.execute(consl_gms)
              coor_gms = resultado_gms.getvalue(0, 0)
              coor_sirgas = punto.slice(6..-2).split(" ")
            end
            respond_to do |format|
              conversion = {
                gms: coor_gms,
                wgs84: coor_wgs84.map { |cc| cc.to_f.round(6).to_s },
                sirgas: coor_sirgas.map { |cc| cc.to_f.round(6).to_s },
                on: coor_on.map { |cc| cc.to_f.round(6).to_s },
                mensaje_error: mensaje_error,
              }
              format.json { render(json: conversion, status: :ok) }
              format.html { render(inilne: conversion.to_s, status: :ok) }
            end
          end

          def new
            @registro = @lugarpreliminar = Apo214::Lugarpreliminar.new
            @registro.propietario = Apo214::Propietario.new
            Apo214::Riesgo.all.each do |_ri|
              @lugarpreliminar.evaluacionriesgo.new
            end
            @registro.save!(validate: false)
            redirect_to(apo214.edit_lugarpreliminar_path(@registro), turbo: true)
          end

          def update
            if lugarpreliminar_params &&
                lugarpreliminar_params[:propietario_attributes]
              if lugarpreliminar_params[:propietario_attributes][:personapropietario_attributes][:id].to_i > 0 &&
                  Msip::Persona.where(
                    id: lugarpreliminar_params[:propietario_attributes][:personapropietario_attributes][:id].to_i,
                  ).count == 1
                @registro.propietario.persona_id = lugarpreliminar_params[:propietario_attributes][:personapropietario_attributes][:id].to_i
                @registro.propietario.save!(validate: false)
              end
            end
            # Ubicamos los de autocompletacion y para esos creamos un registro
            if lugarpreliminar_params &&
                lugarpreliminar_params[:persona_attributes][:id].to_i > 0 &&
                Msip::Persona.where(
                  id: lugarpreliminar_params[:persona_attributes][:id].to_i,
                )
                    .count == 1
              @lugarpreliminar
                .persona_id = lugarpreliminar_params[:persona_attributes][:id]
              params[:lugarpreliminar][:persona_id] = @lugarpreliminar
                .persona_id
              @lugarpreliminar.save!(validate: false)
            else
              persona = Msip::Persona
                .new(lugarpreliminar_params[:persona_attributes])
              if persona.save
                persona.save!
                @lugarpreliminar.persona_id = persona.id
              end
            end
            if lugarpreliminar_params[:listadepositado_attributes]
              lugarpreliminar_params[:listadepositado_attributes].each do |a|
                # Ubicamos los de autocompletacion
                next unless a[1] && a[1][:id].nil? &&
                  a[1][:personadepositada_attributes] &&
                  a[1][:personadepositada_attributes][:id] &&
                  a[1][:personadepositada_attributes][:id].to_i > 0 &&
                  Msip::Persona.where(
                    id: a[1][:personadepositada_attributes][:id].to_i,
                  )
                    .count == 1

                ld = Apo214::Listadepositado.create(
                  lugarpreliminar_id: @lugarpreliminar.id,
                  persona_id: a[1][:personadepositada_attributes][:id],
                )
                ld.save!(validate: false)
                params[:lugarpreliminar][:listadepositado_attributes][a[0]
                  .to_s][:id] = ld.id
              end
            end
            if lugarpreliminar_params[:listapersonafuente_attributes]
              lugarpreliminar_params[:listapersonafuente_attributes].each do |a|
                # Ubicamos los de autocompletacion
                next unless a[1] && a[1][:id].nil? &&
                  a[1][:personafuente_attributes] &&
                  a[1][:personafuente_attributes][:id] &&
                  a[1][:personafuente_attributes][:id].to_i > 0 &&
                  Msip::Persona.where(
                    id: a[1][:personafuente_attributes][:id].to_i,
                  ).count == 1

                lp = Apo214::Listapersonafuente.create(
                  lugarpreliminar_id: @lugarpreliminar.id,
                  persona_id: a[1][:personafuente_attributes][:id],
                )
                lp.save!(validate: false)
                params[:lugarpreliminar][:listapersonafuente_attributes][a[0]
                  .to_s][:id] = lp.id
              end
            end

            # Procesar ubicacionespre de migracion
            if lugarpreliminar_params[:ubicacionpre_pais_id] &&
                lugarpreliminar_params[:ubicacionpre_pais_id] != ""
              @registro.ubicacionpre_id = Msip::Ubicacionpre.buscar_o_agregar(
                lugarpreliminar_params[:ubicacionpre_pais_id],
                lugarpreliminar_params[:ubicacionpre_departamento_id],
                lugarpreliminar_params[:ubicacionpre_municipio_id],
                lugarpreliminar_params[:ubicacionpre_centropoblado_id],
                lugarpreliminar_params[:ubicacionpre_lugar],
                lugarpreliminar_params[:ubicacionpre_sitio],
                lugarpreliminar_params[:ubicacionpre_tsitio_id],
                lugarpreliminar_params[:ubicacionpre_latitud_localizado]
                  .a_decimal_nolocalizado,
                lugarpreliminar_params[:ubicacionpre_longitud_localizado]
                  .a_decimal_nolocalizado,
              )
              begin
                @registro.save!(validate: false)
              rescue e
              end
            end

            update_gen
          end

          def new_modelo_path(o)
            new_lugarpreliminar_path
          end

          def vistas_manejadas
            ["Lugarpreliminar"]
          end

          private

          def set_lugarpreliminar
            @registro = @basica = @lugarpreliminar =
                          Apo214::Lugarpreliminar.find(
                            Lugarpreliminar.connection.quote_string(params[:id]).to_i,
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
