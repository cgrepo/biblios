Rails.application.routes.draw do
  

  resources :responsables
  resources :libraries
  resources :users
  resources :sessions, only:[:new, :create, :destroy]
  get 'welcome/index'
  get "/login" => "sessions#new", as: "login"
  delete "/logout" => "sessions#destroy", as: "logout"
  root to: 'welcome#index'


  
end
