Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # Cars routes
  resources :cars do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :update, :show] do
    resources :feedbacks, only: [:new, :create]
  end
end
