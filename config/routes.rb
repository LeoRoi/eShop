Rails.application.routes.draw do
  resources :line_items do
    put 'decrease', on: :member
    put 'increase', on: :member
  end

  resources :carts
  root 'catalog#index', as: 'catalog/index'

  resources :products
end
