Rails.application.routes.draw do
  get 'sessions/new'
  root 'pages#home'
  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'
  get '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get 'users/:id' , to: 'users#show'
  
  resources :users
  
end
