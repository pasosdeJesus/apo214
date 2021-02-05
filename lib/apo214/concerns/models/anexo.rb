# encoding: UTF-8

require 'sip/concerns/models/anexo'

module Apo214
  module Concerns
    module Models
      module Anexo
        extend ActiveSupport::Concern
        include Sip::Concerns::Models::Anexo

        included do
          has_many :infoanomalia, foreign_key: "anexo_id", 
            validate: true, class_name: 'Apo214::Infoanomalia'
          has_many :listainfofoto, foreign_key: "anexo_id", 
            validate: true, class_name: 'Apo214::Listainfofoto'
          has_many :lugarpreliminar, class_name: 'Apo214::Lugarpreliminar',
            through: :listainfofoto
          validates_attachment_content_type :adjunto, content_type: /\Aimage/, message: "Solo se permite imágenes en png o jpeg"
          validates_attachment_file_name :adjunto, matches: [/png\z/, /jpe?g\z/], message: "Solo se permite imágens en png o jpeg"
        end

        module ClassMethods
        end

      end
    end
  end
end
