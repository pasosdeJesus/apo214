# frozen_string_literal: true

class AgregaUbicacionpreALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column(:apo214_lugarpreliminar, :ubicacionpre_id, :integer)
    add_foreign_key(:apo214_lugarpreliminar, :sip_ubicacionpre, column: :ubicacionpre_id)
  end
end
