Apo214Demo::Application.config.relative_url_root = ENV.fetch(
  'RUTA_RELATIVA', '/apo214')
Apo214Demo::Application.config.assets.prefix = ENV.fetch(
  'RUTA_RELATIVA', '/apo214') == '/' ?
 '/assets' : (ENV.fetch('RUTA_RELATIVA', '/apo214') + '/assets/')
