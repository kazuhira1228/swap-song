Rails.application.routes.draw do
  devise_for :users
  root to: 'tops#index'
  resources :activities, only: [:index, :new, :create, :show]
  resources :users, only: [:index, :show]
end
