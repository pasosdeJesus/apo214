module Apo214
  module Concerns
    module Models
      module Asisreconocimiento
        extend ActiveSupport::Concern

        included do
          include Sip::Modelo 

          belongs_to :lugarpreliminar, class_name: 'Apo214::Lugarpreliminar',
            validate: true, foreign_key: 'lugarpreliminar_id'
          belongs_to :asistente, class_name: 'Sip::Persona', validate: true,
            foreign_key: 'persona_id'
          acts_as_list scope: :asistente, column: :posicion
          accepts_nested_attributes_for :asistente, reject_if: :all_blank, update_only: true

          after_commit :broadcast_me

          def broadcast_me
            ActionCable.server.broadcast "AsisreconocimientoChannel:#{id}",  {
                organizacion: organizacion.titleize,
                mensaje: AsisreconocimientosController.renderer.render(partial: 'apo214/asisreconocimientos/asisreconocimiento', locals: {asisreconocimiento: self})
            }
          end
        end # included
      end
    end
  end
end
