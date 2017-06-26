Rails.application.routes.draw do


  resources :chapters
  resources :categories
  ## Esto es para generar las rutas de TVShow
  resources :tv_shows
  ## Esto es para generar las rutas de Users
  devise_for :users, controllers: { registrations: "registrations" ,  :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users, only: [:show, :destroy]

  resources :videos, only: [:index, :new, :create]

  resources :users do
    member do
      get :following, :followers, :create_follower, :watching
      post :auxiliar_page
    end
  end

  # root :to => 'tvshow', :constraints => {user_signed_in?}
  root :to => 'home#index'

  resources :relationships,       only: [:create, :destroy]

  resources :tv_shows do
    member do
      get :following
    end
  end

  resources :categories do
    member do
      get :followers
    end
  end

  resources :chapters do
    member do
      get :watchers
    end
  end

  resources :watching_relationships,       only: [:create, :destroy]

  resources :categories_relationships,       only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
