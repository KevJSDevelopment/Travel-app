class TripsController < ApplicationController


    def create
        
        room = Room.find(params[:room_id])
        location = Location.find_by(name:params[:location])
        price = params[:price]
        #traveler =  params[:id]
       
        traveler = Traveler.find(params[:traveler][:id])
       
    
        trip = Trip.create(status:"current",room_id:room.id, location_id: location.id,traveler_id:traveler.id ,price:price)
        
        render json: trip.to_json()

        
    end
end
