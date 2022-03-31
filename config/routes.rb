Apo214::Engine.routes.draw do
  resources :lugarespreliminares, path_names: { new: 'nuevo', edit: 'edita' } do
    resources :asisreconocimientos do
      member do
        patch :mover
      end
    end
  end
  get "/personas/remplazar" => 'personas#remplazar'
  get "/lugp/coordenadas" => 'lugarespreliminares#coordenadas'
  namespace :admin do
    ab=::Ability.new
    ab.tablasbasicas.each do |t|
      if (t[0] == "Apo214") 
        c = t[1].pluralize
        resources c.to_sym, 
          path_names: { new: 'nueva', edit: 'edita' }
      end
    end
  end

end
