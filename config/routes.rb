Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  resources :products
  resource :session, only: [:new, :create, :destroy]
  resources :passwords, only: [:new, :create, :edit, :update] 
  root "products#index"
end
