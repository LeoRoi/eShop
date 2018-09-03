Rails.application.routes.draw do
  resources :users
  resources :orders
  resources :line_items do
    put 'decrease', on: :member
    put 'increase', on: :member
  end
  get 'line_items/line_item_current_cart_path', as: 'current_cart'

  resources :carts
  root 'catalog#index', as: 'catalog/index'

  resources :products
end
