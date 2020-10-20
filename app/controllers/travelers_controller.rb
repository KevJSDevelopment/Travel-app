class TravelersController < ApplicationController

    def create 
        
        traveler =  Traveler.create(name:params[:name])
        render json: traveler.to_json()
        
    end


end
