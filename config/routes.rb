# frozen_string_literal: true

# :nodoc:
Rails.application.routes.draw do
  resources :posts do
    resources :comments
    resources :likes
  end
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get 'users', to: 'users#index'
  get 'user', to: 'users#show'
  root to: 'posts#new'
  get '/upload', to: 'images#new'

  resources :friendships
  delete '/delete_friend', to: 'friendships#destroy' 
  delete '/cancel_friend', to: 'friendships#cancel'
  delete '/reject_friend', to: 'friendships#reject'  
  patch '/confirm_friend', to: 'friendships#confirm' 
  resources :images, only: %i[index show create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
