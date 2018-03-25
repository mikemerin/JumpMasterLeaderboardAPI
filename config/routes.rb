Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      resources :scores, only: [:index, :create, :show, :top]
      get '/top', to: 'scores#top'
      get '/top_jumps', to: 'scores#top_jumps'
      get '/top_jumps_num', to: 'scores#top_jumps_num'
      get '/top_three', to: 'scores#top_three'
      get '/top_ten', to: 'scores#top_ten'

    end
  end
end
