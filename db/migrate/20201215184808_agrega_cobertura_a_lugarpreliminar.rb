class AgregaCoberturaALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column :apo214_lugarpreliminar, :cobertura_id, :integer
    add_foreign_key :apo214_lugarpreliminar, :apo214_cobertura, column: :cobertura_id
  end
end
