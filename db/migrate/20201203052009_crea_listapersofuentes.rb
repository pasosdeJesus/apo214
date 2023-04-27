# frozen_string_literal: true

class CreaListapersofuentes < ActiveRecord::Migration[6.0]
  def change
    create_table(:apo214_listapersofuentes) do |t|
      t.integer(:lugarpreliminar_id, null: false)
      t.integer(:persona_id, null: false)
      t.string(:telefono, limit: 1000)
      t.string(:observacion, limit: 5000)
    end
    add_foreign_key(:apo214_listapersofuentes, :apo214_lugarpreliminar, column: :lugarpreliminar_id)
    add_foreign_key(:apo214_listapersofuentes, :sip_persona, column: :persona_id)
  end
end
