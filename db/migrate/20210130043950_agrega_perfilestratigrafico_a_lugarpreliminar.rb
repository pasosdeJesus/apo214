class AgregaPerfilestratigraficoALugarpreliminar < ActiveRecord::Migration[6.0]
  def up
    add_column :apo214_lugarpreliminar, :perfilestratigrafico, :string, 
      limit:5000
  end
  def down
    remove_column :apo214_lugarpreliminar, :perfilestratigrafico, :string, 
      limit:5000
  end
end
