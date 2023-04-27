# frozen_string_literal: true

class AgregaProcesosculALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column(:apo214_lugarpreliminar, :procesoscul, :string, limit: 5000)
  end
end
