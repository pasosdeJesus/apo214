class AgregaTipoentierroALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column :apo214_lugarpreliminar, :tipoentierro_id, :integer
    add_foreign_key :apo214_lugarpreliminar, :apo214_tipoentierro, column: :tipoentierro_id
  end
end
