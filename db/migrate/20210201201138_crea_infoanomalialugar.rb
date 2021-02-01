class CreaInfoanomalialugar < ActiveRecord::Migration[6.0]
  def change
    create_table :apo214_infoanomalialugar do |t|
      t.integer :lugarpreliminar_id, null: false
      t.integer :infoanomalia_id, null: false
    end
    add_foreign_key :apo214_infoanomalialugar, :apo214_lugarpreliminar, column: :lugarpreliminar_id
    add_foreign_key :apo214_infoanomalialugar, :apo214_infoanomalia, column: :infoanomalia_id
  end
end
