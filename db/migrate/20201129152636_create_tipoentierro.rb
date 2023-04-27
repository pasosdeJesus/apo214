# frozen_string_literal: true

class CreateTipoentierro < ActiveRecord::Migration[6.0]
  include Sip::SqlHelper
  def up
    create_table(:apo214_tipoentierro) do |t|
      t.string(:nombre, limit: 500, null: false)
      t.string(:observaciones, limit: 5000)
      t.date(:fechacreacion, null: false)
      t.date(:fechadeshabilitacion)
      t.timestamp(:created_at, null: false)
      t.timestamp(:updated_at, null: false)
    end
    cambiaCotejacion("apo214_tipoentierro", "nombre", 500, "es_co_utf_8")
  end

  def down
    drop_table(:apo214_tipoentierro)
  end
end
