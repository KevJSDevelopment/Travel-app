Rails.application.routes.draw do
  resources :rooms
  resources :hotels, only: [:index]
  resources :trips
  resources :locations
  resources :travelers

  post "/bookings", to: "rooms#bookings"
  post "/hotels", to: "hotels#get_hotel"
  post "/flights", to: "locations#flight_price"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
