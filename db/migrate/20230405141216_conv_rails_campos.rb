# frozen_string_literal: true

class ConvRailsCampos < ActiveRecord::Migration[7.0]
  def change
    rename_column(:apo214_lugarpreliminar, :id_persona, :persona_id)

    rename_column(:apo214_propietario, :id_persona, :persona_id)
    rename_column(:apo214_propietario, :id_lugarpreliminar, :lugarpreliminar_id)
  end
end
