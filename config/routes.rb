Rails.application.routes.draw do
  devise_for :users
  root to: 'tops#index'
  resources :activities do
    resources :comments, only: :create
  end
  resources :groups
  resources :users, only: [:index, :show]
end
