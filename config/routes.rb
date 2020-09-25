Rails.application.routes.draw do
  root 'pages#home'
  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'
  
  get 'signup', to: 'users#new'
  
  resources :users
  
end
