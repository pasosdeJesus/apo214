Apo214::Engine.routes.draw do
  resources :lugarespreliminares, path_names: { new: 'nuevo', edit: 'edita' }
  get '/fotografias/descarga_foto/:id', to: 'infofotos#descarga_foto', 
    as: 'descarga_foto'
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
