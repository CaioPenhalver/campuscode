Rails.application.routes.draw do
  root 'welcome#index'
  resources :recipes, only: [:show, :new, :create]
  resources :cuisines, only: [:show, :new, :create, :edit, :update, :destroy, :index]
  resources :food_types, only: [:show, :new, :create, :edit, :update, :destroy, :index]
  resources :ordinaries, only: [:new, :create, :show, :edit, :update, :destroy]
  post 'admin_login', to: 'sessions#admin_authentication', as: 'admin_authentication'
  post 'login', to: 'sessions#authentication', as: 'authentication'
  get 'login', to: 'sessions#login_admin', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logoutsafsdf'
  get 'filter', to: 'recipes#filter'
  get 'search', to: 'recipes#search'
end
