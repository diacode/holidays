Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]
  
  root to: 'dashboard#index'
  resources :users, path: 'team'
end
