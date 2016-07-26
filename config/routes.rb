Rails.application.routes.draw do
  resources :users do
    collection do
      post :confirm_create
    end
    member do
      patch :confirm_update
    end
  end
end
