# frozen_string_literal: true

class AgregaOrganizacionALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column(:apo214_lugarpreliminar, :organizacion, :string)
  end
end
