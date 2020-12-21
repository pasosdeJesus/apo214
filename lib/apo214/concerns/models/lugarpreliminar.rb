# encoding: UTF-8

module Apo214
  module Concerns
    module Models
      module Lugarpreliminar
        extend ActiveSupport::Concern

        included do
          include Sip::Modelo
          include Sip::Localizacion

          campofecha_localizado :fecha

          belongs_to :persona, foreign_key: "id_persona", dependent: :destroy,
           class_name: 'Sip::Persona'
          accepts_nested_attributes_for :persona,  reject_if: :all_blank
          has_one :propietario, foreign_key: "id_lugarpreliminar", dependent: :destroy,
           class_name: 'Apo214::Propietario'
          accepts_nested_attributes_for :propietario, reject_if: :all_blank, allow_destroy: true
          has_many :personapropietario, through: :propietario, class_name: 'Sip::Persona'
          accepts_nested_attributes_for :personapropietario,  reject_if: :all_blank

          belongs_to :ubicacionpre, class_name: 'Sip::Ubicacionpre', 
            foreign_key: 'ubicacionpre_id', optional: true
          belongs_to :otrolubicacionpre, class_name: 'Sip::Ubicacionpre', 
            foreign_key: 'otrolubicacionpre_id', optional: true
          belongs_to :tipotestigo, class_name: 'Apo214::Tipotestigo',
            foreign_key: 'tipotestigo_id', optional: true
          belongs_to :tipoentierro, class_name: 'Apo214::Tipoentierro',
            foreign_key: 'tipoentierro_id', optional: true
          belongs_to :cobertura, class_name: 'Apo214::Cobertura',
            foreign_key: 'cobertura_id', optional: true
          belongs_to :elementopaisaje, class_name: 'Apo214::Elementopaisaje',
            foreign_key: 'elementopaisaje_id', optional: true
          belongs_to :disposicioncadaveres, class_name: 'Apo214::Disposicioncadaveres',
            foreign_key: 'disposicioncadaveres_id', optional: true

          has_many :listadepositados, dependent: :delete_all,
            class_name: 'Apo214::Listadepositados',
            foreign_key: 'lugarpreliminar_id'

          has_many :personadepositada, through: :listadepositados, class_name: 'Sip::Persona'
          accepts_nested_attributes_for :personadepositada, reject_if: :all_blank
          accepts_nested_attributes_for :listadepositados,
            allow_destroy: true, reject_if: :all_blank
          has_many :listasuelo, dependent: :delete_all,
            class_name: 'Apo214::Listasuelo',
            foreign_key: 'lugarpreliminar_id'

          has_many :suelo, through: :listasuelo, class_name: 'Apo214::Suelo'
          accepts_nested_attributes_for :listasuelo,
            allow_destroy: true, reject_if: :all_blank
          accepts_nested_attributes_for :suelo, reject_if: :all_blank

          has_many :listapersofuentes, dependent: :delete_all,
            class_name: 'Apo214::Listapersofuentes',
            foreign_key: 'lugarpreliminar_id'

          has_many :personafuente, through: :listapersofuentes, class_name: 'Sip::Persona'
          accepts_nested_attributes_for :personafuente, reject_if: :all_blank
          accepts_nested_attributes_for :listapersofuentes,
            allow_destroy: true, reject_if: :all_blank

          validates_length_of :otradisposicioncadaveres, maximum: 1000
          validates_length_of :otrotipotestigo, maximum: 1000

          validates :min_depositados, :numericality => { greater_than_or_equal_to: 0 },
            :allow_nil => true
          validates :max_depositados, :numericality => { greater_than_or_equal_to: 0 },
            :allow_nil => true
          validate :es_menor_que_max

          def es_menor_que_max
            if max_depositados && min_depositados
              if max_depositados < min_depositados
                 errors.add(:max_depositados, 'El número máximo de individuos depositados debe ser mayor que el mínimo')
              end
            end
          end

          attr_accessor :ubicacionpre_texto
          attr_accessor :otrolubicacionpre_texto
          attr_accessor :ubicacionpre_mundep_texto

          def ubicacionpre_texto
            if self.ubicacionpre
              self.ubicacionpre.nombre
            else
              ''
            end
          end

          def otrolubicacionpre_texto
            if self.otrolubicacionpre
              self.otrolubicacionpre.nombre
            else
              ''
            end
          end


          def ubicacionpre_mundep_texto
            if self.ubicacionpre
              self.ubicacionpre.nombre_sin_pais
            else
              ''
            end
          end
        end
      end
    end
  end
end
