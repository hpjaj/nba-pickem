Rails.application.routes.draw do
  devise_for :users

  resources :pools

  root 'welcome#index'
end
