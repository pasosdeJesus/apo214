class AgregaPropietarioALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    create_table :apo214_propietario do |t|
      t.integer :id_lugarpreliminar
      t.integer :id_persona
      t.string :telefono
      t.string :observaciones, limit: 5000
    end
    add_foreign_key :apo214_propietario, :apo214_lugarpreliminar, column: :id_lugarpreliminar
    add_foreign_key :apo214_propietario, :sip_persona, column: :id_persona
  end
end
