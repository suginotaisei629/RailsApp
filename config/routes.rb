Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :products do
    resources :subscribers, only: [:create]
  end

  resource :unsubscribe, only: [:show]
  
  resource :session, only: [:new, :create, :destroy]
  resources :passwords, only: [:new, :create, :edit, :update] 
  root "products#index"
end
