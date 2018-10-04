Rails.application.routes.draw do
  root 'api/v1/foods#index'
  namespace :api do
    namespace :v1 do
      get '/favorite_foods', to: 'favorites#index'
      resources :foods, only: [:index, :show, :create, :update, :destroy]
      resources :meals, only: [:index] do
        get '/foods', to: 'meals#show'
        post '/foods/:id', to: 'meals#create'
        delete '/foods/:id', to: 'meals#destroy'
      end
    end
  end
end
