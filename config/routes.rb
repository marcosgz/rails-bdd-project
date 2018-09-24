Rails.application.routes.draw do
  devise_for :users
  get '/checkout', to: 'products#checkout', as: :checkout
  get '/product/:id/buy', to: 'products#buy', as: :buy_product
  get '/product/:id', to: 'products#show', as: :product
  root to: 'products#index'
end
