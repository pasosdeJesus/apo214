class AgregaRiesgosdaniosALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column :apo214_lugarpreliminar, :riesgosdanios, :string, limit: 500
  end
end
