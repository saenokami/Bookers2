Rails.application.routes.draw do
 
 get '/home/about', to: 'homes#about', as: 'about'

  root to: 'homes#top'
  devise_for :users
  
  resources :books, only: [:create, :new, :index, :show, :edit,:update, :destroy]
  resources :users, only: [:show, :edit, :index, :update]
  
  resources :users, only: [:show, :edit, :index, :update] do
  resources :books, only: [:create]
end

  
end

