Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get 'user/detail'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'auth/:provider/callback', to: 'sessions#callback'
  get '/logout', to: 'sessions#destroy'

  root 'application#home'
end
