Rails.application.routes.draw do
  resources :posts
  
  devise_for :users

  root to: 'posts#new'

  get '/upload', to: 'images#new'
  resources :images, only: %i[index show create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
