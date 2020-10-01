Rails.application.routes.draw do
  
  #トップページアクション
  root 'pages#home'
  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'
  
  #新規登録アクション
  get '/signup', to: 'users#new'
  
  #問い合わせアクション
  get 'inquiries/new'
  get 'inquiries/create'
  get '/inquiries', to: 'inquiries#new'
  post '/inquiries', to: 'inquiries#create'
  
  #ログイン、ログアウトに関してのアクション
  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  #マイページに関してのアクション
  get 'users/:id' , to: 'users#show'
  
  #プロフィール画面に関してのアクション
  get 'profiles/new'
  get 'users/:id/profile' , to: 'profiles#show', as: 'profile_show'
  post 'users/:id/profile' , to: 'profiles#create'
  
  
  resources :users
end
