Rails.application.routes.draw do
 
 get 'homes/about', to: 'homes#about', as: 'about'
 root to: 'homes#top'
  devise_for :users
  
  resources :books, only: [:create, :new, :index, :show, :edit,:update, :destroy]
  resources :users, only: [:show, :edit, :index, :update]
  
end

resources :users, only: [:show, :edit, :index, :update] do
resources :books, only: [:create]
end
