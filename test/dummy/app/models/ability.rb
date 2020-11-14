class Ability  < Apo214::Ability

  # Autorizacion con CanCanCan
  def initialize(usuario = nil)
    initialize_apo214(usuario)
  end

end

