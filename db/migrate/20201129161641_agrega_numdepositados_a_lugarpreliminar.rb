# frozen_string_literal: true

class AgregaNumdepositadosALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column(:apo214_lugarpreliminar, :min_depositados, :integer)
    add_column(:apo214_lugarpreliminar, :max_depositados, :integer)
  end
end
