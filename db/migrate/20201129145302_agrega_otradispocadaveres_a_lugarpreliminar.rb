# frozen_string_literal: true

class AgregaOtradispocadaveresALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column(:apo214_lugarpreliminar, :otradisposicioncadaveres, :string, limit: 1000)
  end
end
