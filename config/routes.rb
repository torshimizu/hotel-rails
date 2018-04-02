Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'admin#index'
  resources :reservations
  match '/reservations/by_date/:date', to: 'reservations#by_date', as: 'by_date', via: :get
  match '/reservations/find_reservation/:last_name', to: 'reservations#find_reservation', as: 'find', via: :get
  resources :rooms, only: [:index, :show]
  resources :admin, only: [:index]
end
