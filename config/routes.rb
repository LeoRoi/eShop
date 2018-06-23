Rails.application.routes.draw do
  resources :carts
  root 'catalog#index', as: 'catalog/index'

  resources :products
end
