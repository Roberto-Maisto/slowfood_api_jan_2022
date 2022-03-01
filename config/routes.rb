Rails.application.routes.draw do
  namespace :api do
    resources :orders, only: [:index]
    get :orders, controller: :orders, action: :index
  end
end
