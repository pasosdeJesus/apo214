class RenombraApo214Listadepositados < ActiveRecord::Migration[7.0]
  def change
    rename_table :apo214_listadepositados, :apo214_listadepositado
  end
end
