Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]  do
    resources :posts, only: [:index, :show] do
      resources :likes, only: [:create]
    end
  end

  get 'posts/new', to: 'posts#new'
  post 'posts', to: 'posts#create'
  post 'posts/:id/comments', as: 'comments', to: 'comments#create'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
