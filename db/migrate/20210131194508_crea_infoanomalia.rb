class CreaInfoanomalia < ActiveRecord::Migration[6.0]
 def change
    create_table :apo214_infoanomalia do |t|
      t.string :anomalia, limit: 100
      t.string :descripcion, limit: 5000
      t.float :latitud
      t.float :longitud
      t.string :area, limit: 1024
      t.binary :waypoint
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
  end

  def down
    drop_table :apo214_infoanomalia
  end
end
