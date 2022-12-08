require "application_system_test_case"

class IniciarSesionTest < ApplicationSystemTestCase

  test "iniciar sesión" do
    Msip::CapybaraHelper.iniciar_sesion(self, root_path, 'msip', 'msip')
  end

end
