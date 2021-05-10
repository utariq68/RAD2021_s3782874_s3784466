Rails.application.routes.draw do

  root "items#index"

  get '/men', to: 'items#men'

  get '/women', to: 'items#female'

  get '/kids', to: 'items#kids'

  get '/save', to: 'items#save'

  get '/save/:id', to: 'items#add', as: 'itemAdd'

  get '/remove/:id', to: 'items#remove', as: 'itemRemove'

  get '/newsletter', to: 'news_letter#newsletter'

  post '/newsletter', to: 'news_letter#newsletter'

  get '/item', to: 'items#item_details'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
