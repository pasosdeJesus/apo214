# frozen_string_literal: true

class AgregaEvaluacionlugarALugar < ActiveRecord::Migration[6.0]
  def change
    add_column(:apo214_lugarpreliminar, :evaluacionlugar, :string, limit: 5000)
  end
end
