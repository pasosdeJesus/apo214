# frozen_string_literal: true

class CreateTipotestigo < ActiveRecord::Migration[6.0]
  include Sip::SqlHelper
  def up
    create_table(:apo214_tipotestigo) do |t|
      t.string(:nombre, limit: 500, null: false)
      t.string(:observaciones, limit: 5000)
      t.date(:fechacreacion, null: false)
      t.date(:fechadeshabilitacion)
      t.timestamp(:created_at, null: false)
      t.timestamp(:updated_at, null: false)
    end
    cambiaCotejacion("apo214_tipotestigo", "nombre", 500, "es_co_utf_8")
  end

  def down
    drop_table(:apo214_tipotestigo)
  end
end
