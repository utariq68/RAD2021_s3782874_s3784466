Rails.application.routes.draw do
  root 'home#index'
  get 'home/men'
  get 'home/women'
  get 'home/kids'
  get 'home/saved_list'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
