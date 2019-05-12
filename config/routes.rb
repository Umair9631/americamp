Rails.application.routes.draw do
  get '/page-2', to: 'page2#index', as: 'page2'
  root 'home#index'
  match "/delayed_job" => DelayedJobWeb, :anchor => false, :via => [:get, :post]

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  resources :rooms, only: [:index, :new, :create]
  resources :meetings
  resources :settings, only: [:index, :update] do
    collection do
      get :outlook
    end
  end
  
  resources :admin
  resources :guest, only: [:index] do
    collection do
      post :verify_pin
    end
  end
  
end
