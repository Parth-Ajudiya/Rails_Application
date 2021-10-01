Rails.application.routes.draw do
  root 'page#home'
  get 'about', to: 'pages#about'
  resources :articles
  get "signup", to: "users#new"
  resource :users
end 
