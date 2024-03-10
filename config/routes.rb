Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  
  resources :order, only: [:index] do
    get 'download_orders', on: :member
  end    
end