Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      resources :scores, only: [:index, :create, :show, :top]
      get '/top', to: 'scores#top'
      get '/top_three', to: 'scores#top_three'
      get '/top_n/:num', to: 'scores#top_n'

    end
  end
end
