Rails.application.routes.draw do
  
  root 'pages#home'
  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'
  get '/signup', to: 'users#new'
  
  #ログイン、ログアウトに関してのアクション
  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  #マイページに関してのアクション
  get 'users/:id' , to: 'users#show'
  
  #プロフィール画面に関してのアクション
  get 'profiles/new'
  get 'users/:id/profile' , to: 'profiles#show'
  post 'users/:id/profile' , to: 'profiles#create'
  
  
  resources :users
end
