Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'
  resources :books
  resources :users
  resources :favorites
  resources :book_comments
  # resources :books, only: [:new, :create, :index, :show, :destroy]
  get 'home/about' => 'homes#about'
end
