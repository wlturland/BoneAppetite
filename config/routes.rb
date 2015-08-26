Rails.application.routes.draw do
  get 'storefont/index'

  resources :products
  resources :brands
  resources :categories
  root to: 'visitors#index'
  devise_for :users
end
