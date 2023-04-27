# frozen_string_literal: true

class AgregaObservacionesALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column(:apo214_lugarpreliminar, :observaciones, :string, limit: 5000)
  end
end
