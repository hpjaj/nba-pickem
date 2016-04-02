Rails.application.routes.draw do
  devise_for :users

  resources :pools
  resources :picks

  root 'welcome#index'
end
