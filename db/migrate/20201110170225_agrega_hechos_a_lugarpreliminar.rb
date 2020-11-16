class AgregaHechosALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column :apo214_lugarpreliminar, :hechos, :text, limit: 5000
  end
end
