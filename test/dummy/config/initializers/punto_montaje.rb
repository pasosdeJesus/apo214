# frozen_string_literal: true

Apo214Demo::Application.config.relative_url_root = ENV.fetch(
  "RUTA_RELATIVA", "/apo214"
)
Apo214Demo::Application.config.assets.prefix = if ENV.fetch(
  "RUTA_RELATIVA", "/apo214"
) == "/"
  "/assets"
else
  (ENV.fetch("RUTA_RELATIVA", "/apo214") + "/assets/")
end
