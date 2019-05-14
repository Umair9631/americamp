Rails.application.routes.draw do
  get '/page-2', to: 'page2#index', as: 'page2'
  root 'home#index'
  match "/delayed_job" => DelayedJobWeb, :anchor => false, :via => [:get, :post]

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  
  namespace :api do
    namespace :v1 do

      resources :users, only: [:show] do
        collection do
          post :signin
        end
      end

    end
  end
  
end
