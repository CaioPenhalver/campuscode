Rails.application.routes.draw do
  root 'welcome#index'
  resources :recipes, only: [:show, :new, :create]
  resources :cuisines, only: [:show, :new, :create, :edit, :update, :destroy, :index]
  resources :food_types, only: [:show, :new, :create, :edit, :update, :destroy, :index]
  resources :ordinaries, only: [:new, :create, :show, :edit, :update, :destroy]
  post 'login', to: 'sessions#authentication', as: 'authentication'
  get 'login', to: 'sessions#login', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'filter', to: 'recipes#filter'
  get 'search', to: 'recipes#search'
end
