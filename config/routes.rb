Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'
  resources :books do
    resource :favorites
    resources :book_comments
  end
  resources :users
  # resources :books, only: [:new, :create, :index, :show, :destroy]
  get 'home/about' => 'homes#about'

  # post '/favorites/:id', to: 'favorites#create', as: 'book_favorites'
  # delete '/favorites/:id', to: 'favorites#destroy'
end
