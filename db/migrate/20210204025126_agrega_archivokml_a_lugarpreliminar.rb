class AgregaArchivokmlALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column :apo214_lugarpreliminar, :archivokml_id, :integer
    add_foreign_key :apo214_lugarpreliminar, :sip_anexo, column: :archivokml_id
  end
end
