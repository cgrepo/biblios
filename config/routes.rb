Rails.application.routes.draw do
  resources :blockeds
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
    resources :profiles, only: [:new, :create, :destroy, :edit, :update]
  end
end
