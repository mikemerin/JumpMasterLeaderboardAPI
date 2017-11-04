Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      resources :scores, only: [:index, :create, :show]
      resources :users, only: [:index, :create, :show]

    end
  end
end
