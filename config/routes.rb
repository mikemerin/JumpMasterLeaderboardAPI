Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      resources :scores, only: [:index, :create, :show, :top]
      get '/top/:num', to: 'scores#top'
      get '/top_three', to: 'scores#top_three'

    end
  end
end
