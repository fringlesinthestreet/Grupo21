Rails.application.routes.draw do


  ## Esto es para generar las rutas de TVShow
  resources :tv_shows
  ## Esto es para generar las rutas de Users
  devise_for :users, controllers: { registrations: "registrations" }
  
  resources :users, only: [:show, :destroy]
  # root :to => 'tvshow', :constraints => {user_signed_in?}
  root :to => 'home#index'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
