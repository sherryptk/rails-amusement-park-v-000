Rails.application.routes.draw do

  resources :users, :attractions, :rides
  root to: "users#index"
  get '/signin', to: 'users#signin'
  post '/signin', to: 'users#create'

end
