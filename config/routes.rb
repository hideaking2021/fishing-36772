Rails.application.routes.draw do
  devise_for :users
  root to: "fishings#index"
  resources :fishings do
    resources :comments, only: [:create]
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show]
  resources :likes, only: [:create]
end
