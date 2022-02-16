Rails.application.routes.draw do
  get 'makers/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'pages#index'

  resources :products,only: %i[index show]
  resources :categories,only: %i[show]
  resources :makers,only: %i[show]

  resources :orders,only: %i[create]
end
