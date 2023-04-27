# frozen_string_literal: true

class AgregaOtrotipotestigoALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column(:apo214_lugarpreliminar, :otrotipotestigo, :string)
  end
end
