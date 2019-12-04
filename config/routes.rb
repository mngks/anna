Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'foods#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

      resources :foods, only: [:show, :new, :create] do
      resources :donations, only: [:create, :show]
    end

    resources :donations, only: [:index]

    resources :users, only: [:show]

    resources :donors, only: [:new, :create]

end
