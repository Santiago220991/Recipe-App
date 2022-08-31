Rails.application.routes.draw do
  resources :public_recipes, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to:'foods#index'
  resources :foods, only:[:index, :new, :create, :destroy] do
  end
  resources :general_shopping_list, only:[:index]

  resources :recipes, only: [:index, :new, :create, :destroy, :show] do
    resources :recipe_foods , only: [:edit, :new, :create, :destroy, :update]
  end

  match "recipes/:recipe_id" => "recipes#toggle_public", as: :toggle_public, via: :patch
  # Defines the root path route ("/")
  # root "articles#index"
  end
  