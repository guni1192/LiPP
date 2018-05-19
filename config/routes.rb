Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get 'user/detail'
      get 'projects/:id',      to: 'projects#show'
      get 'projects/:id/logs', to: 'projects#logs'
      resources :projects, only: %i[index create destroy]
      resources :repos, only: %i[index show]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'auth/:provider/callback', to: 'sessions#callback'
  get '/logout', to: 'sessions#destroy'
  post '/hooks', to: 'github#hooks'

  root 'application#home'
end
