Rails.application.routes.draw do
  root 'catalog#index', as: 'catalog/index'

  resources :products
end
