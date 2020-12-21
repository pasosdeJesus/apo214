class AgregaInteratropicasALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column :apo214_lugarpreliminar, :interatroprevias, :string, limit: 5000
    add_column :apo214_lugarpreliminar, :interatroactuales, :string, limit: 5000
  end
end
