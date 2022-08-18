Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'

  get '/homes/about' => 'homes#about', as:'about'


  resources :books, only: [:index, :show, :edit]
  post 'books' => 'books#create'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"


end
