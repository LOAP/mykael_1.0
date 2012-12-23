Rails3BootstrapDeviseCancan::Application.routes.draw do
  resources :bios
  resources :pages#, except: :show
  resources :friendships
  resources :profiles, :posts
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users do
    resources :posts
    resources :profiles
    resources :bios
  end
  #get ':id', to: 'pages#show', as: :page
end

