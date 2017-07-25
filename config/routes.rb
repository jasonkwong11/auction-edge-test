Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'auctions#index'
  resources :auctions do
    collection { post :import }
    resources :vehicles
  end
end
