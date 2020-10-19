class RoomsController < ApplicationController

    def bookings
        location = Location.find_by(name: params[:destination])
        hotels = Hotel.where(location_id: location.id)
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
