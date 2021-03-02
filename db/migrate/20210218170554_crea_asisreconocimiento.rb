class CreaAsisreconocimiento < ActiveRecord::Migration[6.0]
  def change
    create_table :apo214_asisreconocimiento do |t|
      t.integer :lugarpreliminar_id
      t.integer :persona_id
      t.string :organizacion, limit: 5000
    end
    add_foreign_key :apo214_asisreconocimiento, :apo214_lugarpreliminar, column: :lugarpreliminar_id
    add_foreign_key :apo214_asisreconocimiento, :sip_persona, column: :persona_id
  end
end
