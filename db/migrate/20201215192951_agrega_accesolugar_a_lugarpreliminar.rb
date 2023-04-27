# frozen_string_literal: true

class AgregaAccesolugarALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column(:apo214_lugarpreliminar, :accesolugar, :string, limit: 5000)
  end
end
