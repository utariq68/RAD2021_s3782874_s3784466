Rails.application.routes.draw do
  get 'collection/men', to: 'collection#men'
  get 'collection/women', to: 'collection#women'
  get 'collection/kids', to: 'collection#kids'
  get 'collection/newarrivals', to: 'collection#new'
  get 'collection/all', to: 'collection#all'
  root 'home#index'
  get 'home/saved_list'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
