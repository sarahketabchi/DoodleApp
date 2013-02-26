DoodleApp::Application.routes.draw do

  root :to => "images#index"
  devise_for :users

  resources :images










end
