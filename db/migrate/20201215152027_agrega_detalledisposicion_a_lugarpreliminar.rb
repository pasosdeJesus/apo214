class AgregaDetalledisposicionALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column :apo214_lugarpreliminar, :detallesdisposicion, :string, limit: 5000
  end
end
