class Ability  < Ap214::Ability

  # Autorizacion con CanCanCan
  def initialize(usuario = nil)
    initialize_ap214(usuario)
  end

end

