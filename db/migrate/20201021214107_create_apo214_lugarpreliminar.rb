# frozen_string_literal: true

class CreateApo214Lugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    create_table(:apo214_lugarpreliminar) do |t|
      t.date(:fecha)
      t.string(:codigositio)
      t.timestamps
    end
  end
end
