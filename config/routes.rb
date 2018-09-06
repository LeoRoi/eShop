Rails.application.routes.draw do

  # no index in url
  get 'admin' => 'admin#index'

  # different url mapping
  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

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
