Rails.application.routes.draw do

  devise_for :admins
  devise_for :users

  root to: 'products#index'

  resources :products, only: [:index, :show]
  resource :cart, only: [:show] do
    put 'add/:product_id', to: 'carts#add', as: :add_to
    put 'remove/:product_id', to: 'carts#remove', as: :remove_from
    put 'remove_one/:product_id', to: 'carts#removeone', as: :remove_one
  end
  
  resources :transactions, only: [:new, :create]
  resources :orders, only: [:index, :destroy]

  namespace :admin do
    root to: 'products#index'
    resources :products, only: [:index, :new, :show, :create, :edit, :update, :destroy]
    resources :orders, only: [:index, :destroy] 
  end

  namespace :api do
    namespace :v1 do
      resources :orders
    end
  end

end
