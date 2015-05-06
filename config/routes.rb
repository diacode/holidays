Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]

  root to: 'dashboard#index'
  resources :users, path: 'team'

  resources :vacation_requests, only: [:index, :edit]

  namespace :api do
    namespace :v1 do
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
    end
  end
end
