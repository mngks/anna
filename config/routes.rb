Rails.application.routes.draw do
  get 'reviews/index'
  get 'users/show'
  devise_for :users
  root to: 'foods#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :foods, only: [:show, :new, :create] do
    resources :donations, only: [:create, :show]
  end

  resources :donations, only: [:index]

  resources :users, only: [:show, :edit, :update] do
    resources :foods, only: [:index]
    resources :reviews, only: [:index]
  end

  resources :donors, only: [:new, :create]

  resources :messages, only: [:index, :new, :create]

end
