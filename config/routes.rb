Rails.application.routes.draw do
  resources :transactions
  resources :products
  resources :stores
  resources :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
