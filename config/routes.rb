Rails.application.routes.draw do
  get '/about' => 'homes#about', as: 'about'
  devise_for :users

  resources :books, only: [:index, :show, :edit, :create]
  resources :users, only: [:index,:show, :edit]
  post 'books' => 'books#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"


end
