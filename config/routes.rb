DoodleApp::Application.routes.draw do
  root :to => "images#index"
  devise_for :users

  resources :images do
    resource :favorite, :only => [:create, :destroy]
  end

  resources :users, :only => [:index, :show]
  # REV: trim extra trailing whitespace; looks wonky.



end
