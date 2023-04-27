# frozen_string_literal: true

class AgregaAnexosALugarpreliminar < ActiveRecord::Migration[6.0]
  def up
    create_table(:apo214_listaanexo) do |t|
      t.date(:fecha)
      t.integer(:lugarpreliminar_id, null: false)
      t.integer(:anexo_id, null: false)
      t.timestamp(:created_at, null: false)
      t.timestamp(:updated_at, null: false)
    end
    add_foreign_key(:apo214_listaanexo, :apo214_lugarpreliminar, column: :lugarpreliminar_id)
    add_foreign_key(:apo214_listaanexo, :sip_anexo, column: :anexo_id)
  end

  def down
    drop_table(:apo214_listaanexo)
  end
end
