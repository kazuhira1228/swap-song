Rails.application.routes.draw do
  devise_for :users
  root to: 'tops#index'
  resources :activities
  resources :groups
  resources :users, only: [:index, :show]
end
