class TravelersController < ApplicationController

    def create 
        
     traveler =  Traveler.create(name:params[:name],current_location: Location.all.sample.name )
     render json: traveler.to_json()
        
    end


end
