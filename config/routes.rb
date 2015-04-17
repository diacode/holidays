Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]

  root to: 'dashboard#index'

  namespace :ap1 do
    namespace :v1 do
      resource :vacation_requests, only: [:index, :create, :update, :destroy]
    end
  end
end
