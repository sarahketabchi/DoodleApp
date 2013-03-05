DoodleApp::Application.routes.draw do
  root :to => 'welcome#index'
  devise_for :users

  resources :images do
    resource :favorite, :only => [:create, :destroy]
  end

  resources :users, :only => [:index, :show] do
    resources :friends
  end

  resources :comments

  #resources :friends
end
