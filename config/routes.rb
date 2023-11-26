Rails.application.routes.draw do
  resources :favourites
  resources :users
  resources :youtube_entries #, only: [:index, :create, :show, :update, :destroy]
  get '/users/find_userName/:user_uid', to: 'users#find_userName'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
