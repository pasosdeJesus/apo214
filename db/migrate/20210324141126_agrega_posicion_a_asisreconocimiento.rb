# frozen_string_literal: true

class AgregaPosicionAAsisreconocimiento < ActiveRecord::Migration[6.1]
  def change
    add_column(:apo214_asisreconocimiento, :position, :integer)
    lugares_con_asis = Apo214::Asisreconocimiento.pluck(:lugarpreliminar_id).uniq - [nil]
    lugares_con_asis.each do |lug|
      Apo214::Asisreconocimiento.where(lugarpreliminar_id: lug).each_with_index do |ar_item, index|
        ar_item.update_column(:position, index + 1)
      end
    end
  end
end
