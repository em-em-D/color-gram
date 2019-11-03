# frozen_string_literal: true

# :nodoc:
Rails.application.routes.draw do
  resources :posts
  devise_for :users
  root to: 'posts#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
