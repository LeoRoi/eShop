Rails.application.routes.draw do

  # static pages as array
  # get '/pages/*page' => 'pages#show'
  # get 'home' => 'pages#show', page: 'home'
  get 'home' => 'pages#home'

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

  # get 'home', action: :show, controller: 'pages'

  # translated for users
  scope '(:locale)' do
    resources :orders
    resources :carts
    resources :line_items do
      put 'decrease', on: :member
      put 'increase', on: :member
    end

    get 'line_items/line_item_current_cart_path', as: 'current_cart'

    # GET and POST
    root 'catalog#index', as: 'catalog/index', via: :all
  end
end
