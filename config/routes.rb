Rails.application.routes.draw do
  get 'reviews/index'
  get 'users/show'
  devise_for :users
  root to: 'foods#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :foods, only: [:show, :new, :create, :edit, :update] do
    resources :donations, only: [:create, :show]
    resources :messages, only: [:index]
  end
  resources :donations, only: [:update]

  resources :donations, only: [:index] do
    resources :messages, only: [:index, :create]
    resources :reviews, only: [:new, :create]
  end

  resources :users, only: [:show, :edit, :update] do
    resources :foods, only: [:index]
    resources :donations, only: [:index]
    resources :reviews, only: [:index]
  end

  resources :donors, only: [:new, :create]
end
