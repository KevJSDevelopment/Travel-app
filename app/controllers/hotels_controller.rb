class HotelsController < ApplicationController

    def get_hotel

        hotel = Hotel.find(params[:hotel_id])
        render json: hotel.to_json()
    end

end
