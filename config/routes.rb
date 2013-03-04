DoodleApp::Application.routes.draw do
  root :to => 'welcome#index'
  devise_for :users

  resources :images do
    resource :favorite, :only => [:create, :destroy]
  end

  resources :users, :only => [:index, :show]

  resources :comments
end
