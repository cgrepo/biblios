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
  get '/books/:book_id/profiles/new_profile' => "profiles#new_profile", :as => :new_profile
  resources :books 
  # do
  #   resources :profiles
  #   # do
  #   #   get "/books/:book_id/profile/new" => "profile#newProfile", :as => :newProfile
  #   # end
  # end
end
