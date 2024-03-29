# frozen_string_literal: true

Apo214::Engine.routes.draw do
  resources :lugarespreliminares, path_names: { new: "nuevo", edit: "edita" } do
    resources :asisreconocimientos do
      member do
        patch :mover
      end
    end
  end
  get "/personas/remplazar" => "/msip/personas#remplazar"
  get "/remplazaraportante" => "/msip/personas#remplazaraportante"
  get "/remplazardepositado" => "/msip/personas#remplazardepositado"
  get "/remplazarotrafuente" => "/msip/personas#remplazarotrafuente"
  get "/lugp/coordenadas" => "lugarespreliminares#coordenadas"
  get "/regiones/de_depmun" => "admin/regiones#de_depmun",
    as: "region_de_depmun"
  namespace :admin do
    ab = Ability.new
    ab.tablasbasicas.each do |t|
      next unless t[0] == "Apo214"

      c = t[1].pluralize
      resources c.to_sym,
        path_names: { new: "nueva", edit: "edita" }
    end
  end
end
