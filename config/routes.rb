Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to:'foods#index'
  
  resources :foods, only:[:index, :new, :create, :destroy] do
 
  end
  
  # Defines the root path route ("/")
  # root "articles#index"
  end
  