Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]

  root to: 'dashboard#index'
  resources :users, path: 'team'

  resources :vacation_requests, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :vacation_requests, only: [:index, :create, :update, :destroy] do
        member do
          put :approve
          put :reject
        end
      end
    end
  end
end
