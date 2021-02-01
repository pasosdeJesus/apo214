class AgregaFotografiasALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column :apo214_lugarpreliminar, :fotografias, :string, limit: 5000
  end
end
