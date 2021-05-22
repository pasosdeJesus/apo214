class AgregaDescripcionyfechakmlALugarpreliminar < ActiveRecord::Migration[6.1]
  def change
    add_column :apo214_lugarpreliminar, :descripcion_kml_as, :string, limit: 5000
    add_column :apo214_lugarpreliminar, :fecha_kml_as, :datetime
  end
end
