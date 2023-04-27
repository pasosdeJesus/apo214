# frozen_string_literal: true

class AgregaDispocadaveresALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column(:apo214_lugarpreliminar, :disposicioncadaveres_id, :integer)
    add_foreign_key(:apo214_lugarpreliminar, :apo214_disposicioncadaveres, column: :disposicioncadaveres_id)
  end
end
