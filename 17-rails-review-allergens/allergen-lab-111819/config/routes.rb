Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show, :destroy]
  resources :recipes, only: [:index, :new, :create] 
  get '/recipes/sort', to: "recipes#sort", as: 'recipes_sort'

  resources :ingredients, only: [:index, :show]
end
