class RenombraPosition < ActiveRecord::Migration[6.1]
  def change
    rename_column :apo214_asisreconocimiento, :position, :posicion
  end
end
