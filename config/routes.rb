Rails.application.routes.draw do
  resources :order, only: [:index] do
    get 'download_orders', on: :member
  end    
end