Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  get 'comments/create'
  get 'comments/destroy'
  # get 'likes/create'
  # get 'likes/destroy'
  devise_for :users
  resources :users
  # get 'users/index'
  root "posts#index"
  # get 'users/show'
  # get 'posts/index'
  # get 'posts/new'
  # get 'posts/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts do 
    resource :likes, only: [:create, :destroy]
    resource :comments, only: [:create, :destroy]
  end
  resources :comments, only: [:create, :destroy] do
    resource :favorites, only: [:create, :destroy]
  end
end
