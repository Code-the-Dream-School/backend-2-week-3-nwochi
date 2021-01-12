Rails.application.routes.draw do
  root to: 'customers#index'
  resources :customers
  # get '/orders', to: 'orders#index'
  # post '/orders', to: 'orders#create'
  # get '/orders/new', to: 'orders#new', as: 'new_order'
  # get '/orders/:id', to: 'orders#show', as: 'order'
  # put '/orders/:id', to: 'orders#update'
  # delete '/orders/:id', to: 'orders#destroy'
  # get '/orders/:id/edit', to: 'orders#edit', as: 'edit_order'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :orders
end
