Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  ### create user
  post "/users" => "users#create"

  ### create session
  post "/sessions" => "sessions#create"

  ### save streaming service for user
  post "/services" => "services#create"

  ### create join-table connection
  post "/service_users" => "service_users#create"

  ### test movie index
  get "/choices" => "choices#index"

  ### test tmdb index
  get "/photos/:id" => "photos#index"

  ### test url index
  get "/urls/:id" => "urls#show"

  ### test sources index
  get "/sources" => "sources#index"
  
end
