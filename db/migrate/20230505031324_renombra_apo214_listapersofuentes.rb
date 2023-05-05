class RenombraApo214Listapersofuentes < ActiveRecord::Migration[7.0]
  def change
    rename_table :apo214_listapersofuentes, :apo214_listapersonafuente
  end
end
