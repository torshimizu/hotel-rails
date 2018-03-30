Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'admin#index'
  resources :reservations
  resources :rooms, only: [:index, :show]
  resources :admin
end
