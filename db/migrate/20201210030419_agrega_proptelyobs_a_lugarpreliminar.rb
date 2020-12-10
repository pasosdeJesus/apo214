class AgregaProptelyobsALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column :apo214_lugarpreliminar, :telepropietario, :string, limit: 50
    add_column :apo214_lugarpreliminar, :obserpropietario, :string, limit: 1000
  end
end
