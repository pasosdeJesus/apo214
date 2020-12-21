class AgregaElementopaisajeALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column :apo214_lugarpreliminar, :elementopaisaje_id, :integer
    add_foreign_key :apo214_lugarpreliminar, :apo214_elementopaisaje, column: :elementopaisaje_id
  end
end
