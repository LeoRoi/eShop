Rails.application.routes.draw do

  # no index in url
  get 'admin' => 'admin#index'

  # different url mapping
  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  # not translated, only for admin use
  resources :users
  resources :products

  # translated for users
  scope '(:locale)' do
    resources :orders
    resources :carts
    resources :line_items do
      put 'decrease', on: :member
      put 'increase', on: :member
    end
    get 'line_items/line_item_current_cart_path', as: 'current_cart'
    root 'catalog#index', as: 'catalog/index', via: :all
  end
end
