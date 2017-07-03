Rails.application.routes.draw do
  resources :libraries, :responsables, :schools, :groups, :blockeds
  resources :users  do
    collection do
      get 'editPass/:id', action:'editPass', controller:'users', as:'editPass'
      post 'updatePass/:id', action:'updatePass', controller:'users', as:'updatePass'
    end
  #   member do
  #     get 'users/:id', action:'authem'
  #   end
  end
  resources :sessions, only:[:new, :create, :destroy]
  get 'welcome/index'
  get "/login" => "sessions#new", as: "login"
  
  delete "/logout" => "sessions#destroy", as: "logout"
  root to: 'welcome#index'
  resources :books do
    resources :profiles, only: [:new, :create, :destroy, :edit, :update]
  end
  resources :subscriptors do
    get 'credential', to: 'subscriptors#buildCredential'
  end
  resources :borrows, only: [ :index, :new, :create, :getByTitle,  :getByISBN,  :getByAutor,  
  :getByAcc,  :getByName, :findByTitle, :findByISBN, :findByAutor, :findByAcc, :findByName,
  :setReturned] do
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
      get 'orBorrows'
      get 'srchByName'
      get 'srchFiltered'
      put 'setReturned'
    end
  end
end