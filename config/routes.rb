Rails.application.routes.draw do

  devise_for :users

  # resources :posts, only: [:index, :show] do
  #   resources :users, only: [:index, :show]
  # end

  resources :posts

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end

  root to: 'posts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
