class CreaListaevariesgo < ActiveRecord::Migration[6.0]
  def change
    create_table :apo214_listaevariesgo do |t|
      t.integer :lugarpreliminar_id, null: false
      t.integer :evaluacionriesgo_id, null: false
    end
    add_foreign_key :apo214_listaevariesgo, :apo214_lugarpreliminar, column: :lugarpreliminar_id
    add_foreign_key :apo214_listaevariesgo, :apo214_evaluacionriesgo, column: :evaluacionriesgo_id
  end
end
