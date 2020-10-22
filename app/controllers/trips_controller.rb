class TripsController < ApplicationController


    def create
        room = Room.find(params[:room_id])
        location = Location.find_by(name: params[:location])
        destination = Destination.find_by(name: params[:destination])
        #traveler =  params[:id]
        traveler = Traveler.find(params[:traveler][:id])
        trip = Trip.create(status: "Current", room_id: room.id, location_id: location.id, destination_id: destination.id, traveler_id:traveler.id, travel_price: params[:travel_price], room_price: params[:room_price], date_from: params[:date_from], date_to: params[:date_to])
        render json: trip.to_json() 
    end

    def update
        trip = Trip.find(params[:id])
        trip.update(date_from: params[:date_from], date_to: params[:date_to])

        render json: trip.to_json()
    end

    def index
        traveler = Traveler.find(params[:account][:id])
        trips = Trip.where(traveler_id: traveler.id)
        render json: trips.to_json()
    end

    def show 
        trip = Trip.find(params[:id])
        render json: trip.to_json()
    end

end
