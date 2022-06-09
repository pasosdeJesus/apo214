require 'sivel2_gen/concerns/controllers/regiones_controller'

module Apo214
  module Admin
    class RegionesController < Sip::Admin::BasicasController

      before_action :set_region, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sivel2Gen::Region

      include Sivel2Gen::Concerns::Controllers::RegionesController

      def de_depmun
        d = params[:departamento_id] ? params[:departamento_id].to_i : nil
        m = params[:municipio_id] ? params[:municipio_id].to_i : nil

        r = Sivel2Gen::Region.calcula_de_depmun(d, m)
        respond_to do |format|
          format.json { 
            render :json, inline: {region_id: r ? r.id : nil}.to_json, 
            status: :ok 
          }
        end
      end

    end
  end
end
