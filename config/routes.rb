# frozen_string_literal: true

Rails.application.routes.draw do
  get 'static_pages/about'
  get 'static_pages/contact'

  resources :posts do
    resources :comments
  end

  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
