Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'admin#index'
  get 'reservations/by_date', to: 'reservations#by_date', as: 'by_date'
  get 'reservations/find_reservation', to: 'reservations#find_reservation', as: 'find'
  resources :reservations
  resources :rooms, only: [:index, :show]
  resources :admin, only: [:index]
end
