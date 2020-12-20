class CreaSuelo < ActiveRecord::Migration[6.0]
  def change
    create_table :apo214_suelo do |t|
      t.string :profinicial, limit: 100
      t.string :proffinal, limit: 100
      t.string :color, limit: 100
      t.string :textura, limit: 100
      t.string :humedad, limit: 100
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
  end

  def down
    drop_table :apo214_suelo
  end

end
