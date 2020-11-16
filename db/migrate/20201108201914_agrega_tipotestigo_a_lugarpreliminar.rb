class AgregaTipotestigoALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column :apo214_lugarpreliminar, :tipotestigo_id, :integer
    add_foreign_key :apo214_lugarpreliminar, :apo214_tipotestigo, column: :tipotestigo_id
  end
end
