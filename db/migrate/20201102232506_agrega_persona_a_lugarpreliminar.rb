class AgregaPersonaALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column :apo214_lugarpreliminar, :id_persona, :integer
    add_foreign_key :apo214_lugarpreliminar, :sip_persona, column: :id_persona
  end
end
