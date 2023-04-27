# frozen_string_literal: true

class CreaInfoanomalia < ActiveRecord::Migration[6.0]
  def up
    create_table(:apo214_infoanomalia) do |t|
      t.string(:anomalia, limit: 100)
      t.string(:descripcion, limit: 5000)
      t.float(:latitud)
      t.float(:longitud)
      t.string(:area, limit: 1024)
      t.integer(:anexo_id)
      t.timestamp(:created_at, null: false)
      t.timestamp(:updated_at, null: false)
    end
    add_foreign_key(:apo214_infoanomalia, :sip_anexo, column: :anexo_id)
  end

  def down
    drop_table(:apo214_infoanomalia)
  end
end
