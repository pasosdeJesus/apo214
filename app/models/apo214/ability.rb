module Apo214
  class Ability  < Sivel2Gen::Ability

    GRUPO_DESAPARICION_CASOS = 25

    BASICAS_PROPIAS = [
      ['Apo214', 'cobertura'],
      ['Apo214', 'elementopaisaje'],
      ['Apo214', 'riesgo'],
      ['Apo214', 'tipoentierro'],
      ['Apo214', 'tipotestigo'],
      ['Apo214', 'disposicioncadaveres']
    ]

    def tablasbasicas
      r = (Sip::Ability::BASICAS_PROPIAS - 
           [['Sip', 'oficina']]
          ) + Sivel2Gen::Ability::BASICAS_PROPIAS - [
            ['Sivel2Gen', 'actividadoficio'],
            ['Sivel2Gen', 'escolaridad'],
            ['Sivel2Gen', 'estadocivil'],
            ['Sivel2Gen', 'maternidad'] 
          ] +
          BASICAS_PROPIAS
          return r
    end

    # Establece autorizaciones con CanCanCan
    def initialize_apo214(usuario = nil)
      initialize_sivel2_gen(usuario)
      if !usuario || !usuario.rol
        return
      end
      case usuario.rol
      when Ability::ROLADMIN
        can :manage, Apo214::Lugarpreliminar
        can :manage, Apo214::Asisreconocimiento
      end
    end

  end
end
