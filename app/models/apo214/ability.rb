module Apo214
  class Ability  < Heb412Gen::Ability

    GRUPO_DESAPARICION_CASOS = 25

    def tablasbasicas
      r = (Sip::Ability::BASICAS_PROPIAS - 
           [['Sip', 'oficina']]
          ) 
          return r
    end

    # Establece autorizaciones con CanCanCan
    def initialize_apo214(usuario = nil)
      if !usuario || !usuario.rol
        return
      end
      case usuario.rol
      when Ability::ROLADMIN
        can :manage, Mr519Gen::Encuestausuario
      end
    end

  end
end
