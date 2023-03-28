Rails.application.routes.draw do
  get 'bookmarks/new'
  get 'bookmarks/create'
  get 'bookmarks/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "lists#index"
  resources :lists, except: [:edit, :update] do
    resources :bookmarks, only: [:new, :create]
    resources :reviews, only: :create
  end
  resources :lists, only: [:destroy]
  resources :reviews, only: :destroy
  # Defines the root path route ("/")
  # root "articles#index"
end
