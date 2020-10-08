Rails.application.routes.draw do
  
  get 'tours/new'
  get 'tours/create'
  get 'tours/show'
  get 'tours/edit'
  get 'tours/update'
  get 'tours/destroy'
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
  #get 'profiles/new'
  get 'users/:id/profiles', to: 'profiles#new', as: 'profiles_new'
  post 'users/:id/profiles' , to: 'profiles#create'
  get 'users/:id/profile/show' , to: 'profiles#show', as: 'profiles_show'
  get 'users/:id/profile/edit' , to: 'profiles#edit', as: 'profiles_edit'
  patch 'users/:id/profile/edit' , to: 'profiles#update'
  
  #ツアー画面
  get 'users/:id/tours', to: 'tours#new'#, as: 'tours_new'
  post 'users/:id/tours' , to: 'tours#create'
  get 'users/:user_id/tours/:id' , to: 'tours#show', as: 'users_tours_show'
  get 'users/:user_id/tours/:id/edit' , to: 'tours#edit', as: 'users_tours_edit'
  patch 'users/:user_id/tours/:id/edit' , to: 'tours#update'
  delete 'users/:user_id/tours/:id', to: 'tours#destroy', as: 'users_tours_delete'
  
  resources :users
  #resources :tours
  
  namespace :admin do
    resources :users, :profile, :pages
  end 
  
end
