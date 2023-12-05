Rails.application.routes.draw do
  devise_for :users
  resources :posts, only: [:new, :create, :index, :show]
  # get 'users/new'
  # get 'users/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "posts#index"
end
