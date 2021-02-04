class AgregaDesgenanomaliaALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column :apo214_lugarpreliminar, :desgenanomalia, :string, limit:5000
  end
end
