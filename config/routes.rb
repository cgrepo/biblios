Rails.application.routes.draw do
  get 'borrows/index'

  get 'borrowed/index'

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
  resources :borrows, only: [:new, :getByTitle, :getByISBN, :getByAutor, :findByTitle] do
    collection do
      get 'getByTitle'
      get 'findByTitle'
      get 'getByISBN'
      get 'findByISBN'
      get 'getByAutor'
      get 'findByAutor'
      get 'getByAcc'
      get 'findByAcc'
      get 'getByName'
      get 'findByName'
    end
  end
end