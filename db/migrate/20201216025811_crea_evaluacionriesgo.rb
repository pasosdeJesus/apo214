class CreaEvaluacionriesgo < ActiveRecord::Migration[6.0]
  def change
    create_table :apo214_evaluacionriesgo do |t|
      t.integer :riesgo_id
      t.string :descripcion, limit: 5000
      t.integer :calificacion
    end
    add_foreign_key :apo214_evaluacionriesgo, :apo214_riesgo,
      column: :riesgo_id
  end
end
