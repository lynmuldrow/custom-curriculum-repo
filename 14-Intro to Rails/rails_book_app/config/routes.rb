Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
  # get '/patients/:id', to: 'patients#show', as: 'patient'
  resources :google_books_api
end
