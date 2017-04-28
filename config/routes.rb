Rails.application.routes.draw do
  #get 'profile/create'
  #get 'profile/destroy'
  resources :subscriptors do
    get 'credential', to: 'subscriptors#buildCredential'
  end
  resources :groups
  resources :schools
  resources :responsables
  resources :libraries
  resources :users
  resources :sessions, only:[:new, :create, :destroy]
  get 'welcome/index'
  get "/login" => "sessions#new", as: "login"
  delete "/logout" => "sessions#destroy", as: "logout"
  root to: 'welcome#index'
  resources :books do
  end
end
