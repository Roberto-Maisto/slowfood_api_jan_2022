Rails.application.routes.draw do
  namespace :api do
    resources :products, only: [:index]
    get :products, controller: :products, action: :index
  end
end
