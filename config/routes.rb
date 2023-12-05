Rails.application.routes.draw do
  resources :favourites
  resources :users
  resources :youtube_entries do
    collection do
      get 'show_myvideos'
    end
  end

  get '/users/find_userName/:user_uid', to: 'users#find_userName'
  get '/favourites/show_favourites', to: 'favourites#show_favourites'
  delete '/favourites/delete_entry/:id', to: 'favourites#destroy'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
