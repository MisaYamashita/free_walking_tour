Rails.application.routes.draw do
  
  #中間テーブル(参加者)のアクション
  get 'user_tours/create'
  post 'user_tours/create'
  get 'user_tours/destroy'
  delete 'user_tours/destroy'
  
  #トップページアクション
  root 'pages#home'
  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'
  
  #新規登録アクション
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
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
  
  #プロフィール画面に関してのアクション
  get 'users/:id/profiles', to: 'profiles#new', as: 'profiles_new'
  post 'users/:id/profiles', to: 'profiles#create'
  get 'users/:id/profile/show', to: 'profiles#show', as: 'profiles_show'
  get 'users/:id/profile/edit', to: 'profiles#edit', as: 'profiles_edit'
  patch 'users/:id/profile/edit', to: 'profiles#update'
  
  #ツアー検索一覧
  get '/tours', to: 'tours#index', as: 'all_tour'
  
  #ツアー詳細問い合わせアクション'
  get '/tours/:id/tour_contact', to: 'tour_contacts#new', as: 'tour_contacts_new'
  get '/tours/:id/tour_contact', to: 'tour_contacts#create'
  post '/tours/:id/tour_contact', to: 'tour_contacts#create', as: 'tour_contacts_create'
  
  resources :users
  
  resources :tours do
    resources :reviews
  end 
  
  namespace :admin do
    resources :users, :profile, :pages
  end 
  
end
