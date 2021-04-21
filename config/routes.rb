Rails.application.routes.draw do
  devise_for :users
  root to: "boards#index"
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :boards do
    resources :comments, only: :create do
      resources :likes, only: [:create, :destroy]
    end
  end
end
