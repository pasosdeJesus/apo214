class AgregaFechayhoradisALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column :apo214_lugarpreliminar, :fechadis, :date
    add_column :apo214_lugarpreliminar, :horadis, :time
  end
end
