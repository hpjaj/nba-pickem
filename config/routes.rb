Rails.application.routes.draw do
  devise_for :users

  resources :pools
  resources :picks, only: [:index, :new, :create]

  root 'welcome#index'
end
