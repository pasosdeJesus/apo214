# frozen_string_literal: true

class CreaSuelolugar < ActiveRecord::Migration[6.0]
  def change
    create_table(:apo214_listasuelo) do |t|
      t.integer(:lugarpreliminar_id, null: false)
      t.integer(:suelo_id, null: false)
    end
    add_foreign_key(:apo214_listasuelo, :apo214_lugarpreliminar, column: :lugarpreliminar_id)
    add_foreign_key(:apo214_listasuelo, :apo214_suelo, column: :suelo_id)
  end
end
