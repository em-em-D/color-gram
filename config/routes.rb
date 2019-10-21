# frozen_string_literal: true

# :nodoc:
Rails.application.routes.draw do
  resources :posts do
    resources :comments
    resources :likes
  end
  devise_for :users
  get 'users', to: 'users#index'
  get 'user', to: 'users#show'
  root to: 'posts#new'
  get '/upload', to: 'images#new'
  post 'friendship', to: 'friendships#create'
  post 'accept_friendship', to: 'friendships#update'
  delete 'cancel_friendship', to: 'friendships#destroy'
  get 'all_requests', to: 'friendships#show'
  resources :images, only: %i[index show create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
