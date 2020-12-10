class AgregaPropietarioALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column :apo214_lugarpreliminar, :propietario_id, :integer
    add_foreign_key :apo214_lugarpreliminar, :sip_persona, column: :propietario_id 
  end
end
