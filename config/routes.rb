Rails.application.routes.draw do

  # static pages
  get '/pages/:page' => 'pages#show'

  # no index in url
  get 'admin' => 'admin#index'

  # different url mapping
  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  # admin use only
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
