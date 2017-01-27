Rails.application.routes.draw do
  root 'welcome#index'
  resources :recipes, only: [:show, :new, :create]
  resources :cuisines, only: [:new, :create, :show]
  post 'admin_login', to: 'sessions#admin_authentication', as: 'admin_authentication'
  post 'login', to: 'sessions#authentication', as: 'authentication'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logoutsafsdf'
end
