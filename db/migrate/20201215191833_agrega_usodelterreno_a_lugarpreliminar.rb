# frozen_string_literal: true

class AgregaUsodelterrenoALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column(:apo214_lugarpreliminar, :usoterprevios, :string, limit: 5000)
    add_column(:apo214_lugarpreliminar, :usoteractuales, :string, limit: 5000)
  end
end
