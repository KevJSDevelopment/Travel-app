class LocationsController < ApplicationController

    def index
        locations = Location.all
        render json: locations.to_json()
    end
    #new update

end
