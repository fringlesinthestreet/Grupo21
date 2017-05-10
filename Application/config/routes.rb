Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, class_name: 'FormUser', :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}
  resources :series
  resources :capitulos
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


root to: "home#index"

end
