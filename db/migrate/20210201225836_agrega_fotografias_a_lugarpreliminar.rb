class AgregaFotografiasALugarpreliminar < ActiveRecord::Migration[6.0]
  def up
    create_table :apo214_infofoto do |t|
      t.binary :fotografia, limit: 100
      t.string :descripcion, limit: 5000
      t.date :fecha
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
    create_table :apo214_listainfofoto do |t|
      t.integer :lugarpreliminar_id, null: false
      t.integer :infofoto_id, null: false
    end
    add_foreign_key :apo214_listainfofoto, :apo214_lugarpreliminar, column: :lugarpreliminar_id
    add_foreign_key :apo214_listainfofoto, :apo214_infofoto, column: :infofoto_id
  end

  def down
    drop_table :apo214_listainfofoto
    drop_table :apo214_infofoto
  end
end
