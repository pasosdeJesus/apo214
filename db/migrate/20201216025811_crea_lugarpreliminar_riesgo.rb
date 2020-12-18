class CreaLugarpreliminarRiesgo < ActiveRecord::Migration[6.0]
  def change
    create_table :apo214_lugarpreliminar_riesgo do |t|
      t.integer :lugarpreliminar_id
      t.integer :riesgo_id
      t.string :descripcion, limit: 5000
      t.integer :calificacion
    end
    add_foreign_key :apo214_lugarpreliminar_riesgo, :apo214_lugarpreliminar,
      column: :lugarpreliminar_id
    add_foreign_key :apo214_lugarpreliminar_riesgo, :apo214_riesgo,
      column: :riesgo_id
  end
end
