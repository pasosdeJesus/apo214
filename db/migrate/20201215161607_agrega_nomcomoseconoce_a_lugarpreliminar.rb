# frozen_string_literal: true

class AgregaNomcomoseconoceALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column(:apo214_lugarpreliminar, :nomcomoseconoce, :string, limit: 1000)
  end
end
