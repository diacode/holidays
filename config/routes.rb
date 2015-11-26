Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]

  root to: 'dashboard#index'

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create]

      resources :vacation_requests, only: [:index, :show, :create, :update, :destroy] do
        member do
          patch :approve
          patch :reject
        end

        resources :requested_days, only: [:create, :destroy] do
          member do
            patch :approve
            patch :reject
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

  get '*path', to: 'dashboard#index'
end
