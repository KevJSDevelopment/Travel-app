class RoomsController < ApplicationController

    def show
        room = Room.find(params[:id])
        render json: room.to_json()
    end

    def bookings
        destination = Destination.find_by(name: params[:destination])
        hotels = Hotel.where(destination_id: destination.id)
        rooms = []
        hotels.each do |hotel|
            hotel.rooms.each do |room|
                rooms << room
            end
        end
        rooms = rooms.sort_by { |room| room.price }
        render json: rooms.to_json()
    end

end
