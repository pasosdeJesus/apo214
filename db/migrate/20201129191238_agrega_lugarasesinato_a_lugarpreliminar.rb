class AgregaLugarasesinatoALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column :apo214_lugarpreliminar, :insitu, :boolean
    add_column :apo214_lugarpreliminar, :otrolubicacionpre_id, :integer
    add_column :apo214_lugarpreliminar, :detallesasesinato, :string, limit: 5000
    add_foreign_key :apo214_lugarpreliminar, :sip_ubicacionpre, column: :otrolubicacionpre_id
  end
end
