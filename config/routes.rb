Rails.application.routes.draw do
  root 'welcome#index'
  resources :recipes, only: [:show, :new, :create]
  resources :cuisines, only: [:new, :create, :show]
end
