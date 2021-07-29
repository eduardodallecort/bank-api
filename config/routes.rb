Rails.application.routes.draw do
  resources :transactions
  namespace :api, defaults: {format: :json} do
    resources :accounts do
      resources :transactions
    end
  end
end
