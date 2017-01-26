Rails.application.routes.draw do
  resources :recipes, only: [:show, :new, :create]
end
