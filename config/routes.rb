Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      resources :scores, only: [:index, :create, :show, :top]
      get '/top', to: 'scores#top'
      get '/top_jumps', to: 'scores#top_jumps'
      get '/top_jumps_v2', to: 'scores#top_jumps_v2'
      get '/top_jumps_nums', to: 'scores#top_jumps_nums'
      get '/top_jumps_each', to: 'scores#top_jumps_each'
      get '/top_jumps_with_names', to: 'scores#top_jumps_with_names'
      get '/top_three', to: 'scores#top_three'
      get '/top_ten', to: 'scores#top_ten'
      get '/version', to: 'scores#version'
      get '/mdev', to: 'scores#mdev'
      get '/unique', to: 'scores#unique'

      resources :jumps, only: [:index, :create, :show]
      get '/extra_jumps', to: 'jumps#extra_jumps'
    end
  end

end
