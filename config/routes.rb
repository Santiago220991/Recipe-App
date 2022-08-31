Rails.application.routes.draw do
  get 'public_recipes/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to:'foods#index'
  resources :foods, only:[:index, :new, :create, :destroy] do
  end
  resources :general_shopping_list, only:[:index]
  resources :recipes, only: [:index, :new, :create, :destroy, :show]
  # Defines the root path route ("/")
  # root "articles#index"
  end
  