class AgregaUbicaespecificaALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column :apo214_lugarpreliminar, :ubicaespecifica, :text, limit: 5000 
  end
end
