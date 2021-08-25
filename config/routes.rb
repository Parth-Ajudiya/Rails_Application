Rails.application.routes.draw do
  root 'page#home'
  get 'about', to: 'page#about'
  resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
end 
