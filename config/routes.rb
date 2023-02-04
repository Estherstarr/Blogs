Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users

  devise_scope :user do
    root to: "users#index"
  end

  resources :users, only: [:index, :show]  do
    resources :posts, only: [:index, :show, :destroy] do
      resources :likes, only: [:create]
      resources :comments, only: [:create, :destroy]
    end
  end

  get 'posts/new', to: 'posts#new'
  post 'posts', to: 'posts#create'
  post 'posts/:id/comments', as: 'comments', to: 'comments#create'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  
  
  # Defines the root path route ("/")
end
