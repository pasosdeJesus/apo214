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
      r = (Msip::Ability::BASICAS_PROPIAS - 
           [['Msip', 'oficina']]
          ) + Sivel2Gen::Ability::BASICAS_PROPIAS - [
            ['Sivel2Gen', 'actividadoficio'],
            ['Sivel2Gen', 'escolaridad'],
            ['Sivel2Gen', 'estadocivil'],
            ['Sivel2Gen', 'maternidad'] 
          ] +
          BASICAS_PROPIAS
          return r
    end

    NOBASICAS_INDSEQID = [
      ['Apo214', 'asisreconocimiento'], 
      ['Apo214', 'evaluacionriesgo'], 
      ['Apo214', 'infoanomalia'], 
      ['Apo214', 'infoanomalialugar'], 
      ['Apo214', 'listaanexo'], 
      ['Apo214', 'listadepositados'], 
      ['Apo214', 'listaevariesgo'], 
      ['Apo214', 'listainfofoto'], 
      ['Apo214', 'listapersofuentes'], 
      ['Apo214', 'listasuelo'], 
      ['Apo214', 'lugarpreliminar'], 
      ['Apo214', 'propietario'], 
      ['Apo214', 'suelo']
    ]

    # Tablas no básicas pero que tienen índice *_seq_id
    def nobasicas_indice_seq_con_id
      Msip::Ability::NOBASICAS_INDSEQID +
        Mr519Gen::Ability::NOBASICAS_INDSEQID +
        Heb412Gen::Ability::NOBASICAS_INDSEQID +
        Sivel2Gen::Ability::NOBASICAS_INDSEQID +
        Apo214::Ability::NOBASICAS_INDSEQID
    end

    def nobasicas_indice_seq_con_id
      NOBASICAS_INDSEQID
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
