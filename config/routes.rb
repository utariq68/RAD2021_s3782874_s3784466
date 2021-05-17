Rails.application.routes.draw do

  
  get 'authentication/index'
  root "items#index"

  get 'items/profile'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"

  get '/men', to: 'items#men'

  get '/women', to: 'items#female'

  get '/kids', to: 'items#kids'

  get '/save', to: 'items#save'

  get '/save/:id', to: 'items#add', as: 'itemAdd'

  get '/remove/:id', to: 'items#remove', as: 'itemRemove'

  get '/newsletter', to: 'news_letter#newsletter'

  post '/newsletter', to: 'news_letter#newsletter'

  get '/item/:id', to: 'items#item_details', as:'itemDetails'

  get "/auth/twitter/callback", to: "omniauth_callbacks#twitter"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
