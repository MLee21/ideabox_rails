Rails.application.routes.draw do
  resources :users
  resources :ideas

  namespace :admin do 
    resources :categories
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
