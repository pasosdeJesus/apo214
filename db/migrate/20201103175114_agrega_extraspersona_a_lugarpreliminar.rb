# frozen_string_literal: true

class AgregaExtraspersonaALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column(:apo214_lugarpreliminar, :parentezco, :string)
    add_column(:apo214_lugarpreliminar, :grabacion, :boolean)
    add_column(:apo214_lugarpreliminar, :telefono, :string)
  end
end
