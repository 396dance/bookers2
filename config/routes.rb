Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  get '/home/about' => 'homes#about', as: 'about'

  resources :books, only: [:index, :show, :edit, :create, :update, :destroy] do
    resources :book_comments, only:[:create]
    resource :favorites, only: [:create, :destroy]
  end

  resources :users, only: [:index,:show, :edit, :create, :update, :destroy] do
    resource :relationships, only: [:create, :destroy]
      get 'followers' => 'relationships#follows', as: 'follows'
      get 'followeings' => 'relationships#unfollows', as: 'unfollows'
  end

end
