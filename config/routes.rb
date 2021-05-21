Rails.application.routes.draw do

  root "items#index"

  get 'authentication/index'

  get 'items/profile'

  resources :users

  # resources :sessions, only: [:new, :create, :destroy]

  get "signup", to: "users#new", as: "signup"

  get "login", to: "sessions#new"

  get "logout", to: "sessions#destroy", as: "logout"

  post "login", to: "sessions#create"

  get '/newCollection', to: 'items#newCollection'

  get '/men', to: 'items#men'

  get '/women', to: 'items#female'

  get '/kids', to: 'items#kids'

  get '/save', to: 'items#save'

  get 'wishlist', to: 'items#wishlist'

  get '/wishAdd/:id', to: 'items#wishAdd', as: 'addWish'

  get '/wishRemove/:id', to: 'items#wishRemove', as: 'itemRemove'

  # get '/save/:id', to: 'items#add', as: 'itemAdd'

  # get '/remove/:id', to: 'items#remove', as: 'itemRemove'
  post '/newsletter', to: 'news_letter#newsletter'
  get '/newsletter', to: 'news_letter#newsletter'



  get '/item/:id', to: 'items#item_details', as:'itemDetails'

  get "/auth/twitter/callback", to: "omniauth_callbacks#twitter"

  post '/checkout', to: 'items#checkout'

  get '/checkout', to: 'items#checkout'

  post '/add_bag', to: 'items#add_bag'

  get '/add_bag', to: 'items#add_bag'

  get '/bag', to: 'items#bag'

  get '/remove_bag/:id', to: 'items#remove_bag', as: 'removeBag'

  get '/edit_subscription', to: 'items#edit_subscription'

  get '/filteredItems', to: 'items#filteredItems'

  post '/filteredItems', to: 'items#filteredItems'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
