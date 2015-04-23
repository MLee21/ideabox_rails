Rails.application.routes.draw do
  resources :users
  resources :ideas

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
end
