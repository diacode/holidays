Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]

  root to: 'dashboard#index'
  resources :users, path: 'team', only: :index

  resources :vacation_requests, only: [:index, :edit]
  get 'public_calendar', to: 'public_calendar#index'

  resources :settings, only: :index do
    collection do
      get 'public_holidays', to: 'public_holidays#index'
    end
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create]

      resources :vacation_requests, only: [:index, :show, :create, :update, :destroy] do
        member do
          put :approve
          put :reject
        end

        resources :requested_days, only: [:create, :destroy] do
          member do
            put :approve
            put :reject
          end
        end
      end

      resources :requested_days, only: :index
      resources :public_holidays, only: [:index, :destroy] do
        collection do
          post :batch_create
          patch :batch_update
        end
      end
    end
  end
end
