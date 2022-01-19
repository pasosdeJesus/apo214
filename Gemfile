source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
# development dependencies will be added by default to the :development group.

gemspec

gem 'acts_as_list'

gem 'babel-transpiler'

gem 'bcrypt'

gem "best_in_place", git: "https://github.com/mmotherwell/best_in_place"

gem 'bootsnap', '>=1.1.0', require: false

gem 'cancancan'                   # Control de acceso

gem "cocoon", git: "https://github.com/vtamara/cocoon.git",
  branch: 'new_id_with_ajax' # Formularios anidados (algunos con ajax)

gem 'coffee-rails' # CoffeeScript para recuersos .js.coffee y vistas

gem 'hotwire-rails'

gem 'devise'   # Autenticación

gem 'devise-i18n'

gem 'jbuilder' # API JSON facil. Ver: https://github.com/rails/jbuilder

gem 'jsbundling-rails'

gem 'kt-paperclip',                 # Anexos
  git: 'https://github.com/kreeti/kt-paperclip.git'

gem 'libxml-ruby'

gem 'odf-report' # Genera ODT

gem 'prawn' # Generación de PDF

gem 'prawnto_2',  :require => 'prawnto'

gem 'prawn-table'

gem 'rails', '~> 7.0'

gem 'rails-i18n'

gem 'redcarpet' # Descripciones en heb412_gen

gem 'rspreadsheet' # Genera ODS

gem 'rubyzip', '>= 2.0'

gem 'sassc-rails' # Hojas de estilo con SCSS

gem 'simple_form'   # Formularios

gem 'sprockets-rails'

gem 'stimulus-rails'

gem 'turbo-rails'

gem 'twitter_cldr'               # Localiación e internacionalización

gem 'tzinfo' # Zonas horarias


gem 'will_paginate' # Listados en páginas


#####
# Motores que se sobrecargan vistas (deben ponerse en orden de apilamiento
# lógico y no alfabetico como las gemas anteriores)

gem 'sip', # Motor generico
  git: 'https://github.com/pasosdeJesus/sip.git', branch: :main
  #path: '../sip'

gem 'mr519_gen', # Motor de gestion de formularios y encuestas
  git: 'https://github.com/pasosdeJesus/mr519_gen.git', branch: :main
  #path: '../mr519_gen'

gem 'heb412_gen',  # Motor de nube y llenado de plantillas
  git: 'https://github.com/pasosdeJesus/heb412_gen.git', branch: :main
  #path: '../heb412_gen'

gem 'sivel2_gen',  # Motor de nube y llenado de plantillas
  git: 'https://github.com/pasosdeJesus/sivel2_gen.git', branch: :main
  #path: '../sivel2_gen'

group  :development, :test do

  gem 'debug' # Depurar

  gem 'colorize' # Colores en terminal

  gem 'dotenv-rails'
end


group :development do

  gem 'erd'

  gem 'puma'

  gem 'rails-erd'

  gem 'spring' # Acelera ejecutando en fondo.

  gem 'web-console'

end


group :test do
  gem 'cuprite'

  gem 'capybara'

  gem 'selenium-webdriver'

  gem 'simplecov', '<0.18' # Debido a https://github.com/codeclimate/test-reporter/issues/418

end


