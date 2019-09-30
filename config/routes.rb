# frozen_string_literal: true

# :nodoc:
Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end

  devise_for :users
  root to: 'posts#new'
  get '/upload', to: 'images#new'
  resources :images, only: %i[index show create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
