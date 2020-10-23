Rails.application.routes.draw do
  resources :locations
  resources :rooms
  resources :hotels, only: [:index]
  resources :trips, only: [:show]
  resources :destinations 
  resources :travelers, only: [:create, :update]

  post "/bookings", to: "rooms#bookings"
  post "/hotels", to: "hotels#get_hotel"
  post "/flights", to: "destinations#flight_price"
  post "/trips", to: "trips#create"
  post "/travelers/login", to: "travelers#login"

  put "/trips", to: "trips#index"
  patch "/trips/:id", to: "trips#update"

  get "/travelers/:id", to: "travelers#destroy"

  post "/dest_image", to: "destinations#image"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
