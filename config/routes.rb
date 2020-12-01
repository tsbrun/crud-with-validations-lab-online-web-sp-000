Rails.application.routes.draw do
  resources :songs, except: [:delete]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  delete '/songs/:id', :to => 'songs#destroy', :as => 'delete_song'
end
