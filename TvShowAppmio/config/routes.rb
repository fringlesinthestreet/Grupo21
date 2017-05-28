Rails.application.routes.draw do


  ## Esto es para generar las rutas de TVShow
  resources :tv_shows
  ## Esto es para generar las rutas de Users
  devise_for :users, controllers: { registrations: "registrations" ,  :omniauth_callbacks => "users/omniauth_callbacks" }#, skip: [:sessions]

  resources :users, only: [:show, :destroy]

  resources :users do
    member do
      get :following, :followers, :create_follower
      post :auxiliar_page
    end
  end

  # root :to => 'tvshow', :constraints => {user_signed_in?}
  root :to => 'home#index'

  resources :relationships,       only: [:create, :destroy]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end