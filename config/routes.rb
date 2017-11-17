Rails.application.routes.draw do
  root 'welcome#home'
  resources :users
  resources :attractions
  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy', as: 'signout'
  post '/take_ride', to: 'rides#take_ride', as: 'take_ride'

end
