Rails.application.routes.draw do
  get 'signup', to: 'users#new'
  root 'pages#home'
  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'
  
end
