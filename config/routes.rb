Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "toppages#index"
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  get "signup", to: "users#new"
  resources :users, only: [:show,:new,:create] do
    member do
      get :likes
    end
  end
  
  
  resources :posts, only: [:new,:create, :destroy,:show] do
    member do
      get :mentions
      get :mentioned
    end
  end
  
  resources :items, only: [:new]
  resources :likes, only:[:create, :destroy]
  resources :comments, only: [:create, :destroy, :show, :edit, :new]
  resources :comment_relationships, only:[:create, :destroy]
  
  get "rankings/like", to: "rankings#like"
end
