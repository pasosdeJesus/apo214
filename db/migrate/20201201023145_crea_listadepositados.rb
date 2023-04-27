# frozen_string_literal: true

class CreaListadepositados < ActiveRecord::Migration[6.0]
  def change
    create_table(:apo214_listadepositados) do |t|
      t.integer(:lugarpreliminar_id, null: false)
      t.integer(:persona_id, null: false)
    end
    add_foreign_key(:apo214_listadepositados, :apo214_lugarpreliminar, column: :lugarpreliminar_id)
    add_foreign_key(:apo214_listadepositados, :sip_persona, column: :persona_id)
  end
end
