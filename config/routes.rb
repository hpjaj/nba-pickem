Rails.application.routes.draw do
  devise_for :users

  resources :pools, only: [:new, :create, :show]

  root 'welcome#index'
end
