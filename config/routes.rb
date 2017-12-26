Rails.application.routes.draw do
  resources :suggestions
  devise_for :users
  resources :reviews
  resources :visits
  resources :foods
  resources :food_trucks
  resources :favorites, only: [:create, :destroy]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # List of genres
  get 'genres' => 'food_trucks#genre_index'
  # List by genre
  get 'sort' => 'food_trucks#genre'
end
