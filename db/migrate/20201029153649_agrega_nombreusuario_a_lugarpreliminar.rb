# frozen_string_literal: true

class AgregaNombreusuarioALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column(:apo214_lugarpreliminar, :nombreusuario, :string)
  end
end
