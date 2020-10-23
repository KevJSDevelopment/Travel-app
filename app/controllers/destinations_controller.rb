class DestinationsController < ApplicationController

    def index
        destinations = Destination.all
        render json: destinations.to_json()
    end
    
    def show
        destination = Destination.find(params[:id])
        render json: destination.to_json()
    end

    def image 
        dest = Destination.find_by(name: params[:dest_name])
        image = dest.image
        render json: image.to_json()
    end
    
    def flight_price
        loc_1 = Destination.find_by(name: params[:loc_from])
        loc_2 = Destination.find_by(name: params[:loc_to])
        
        if params[:days_out] <= 7
            dist = distance_between(loc_1.latitude, loc_1.longitude, loc_2.latitude, loc_2.longitude)
            price = dist.to_i * 0.1 * 1.5
            render json: price.to_json()
        elsif params[:days_out] <= 14
            dist = distance_between(loc_1.latitude, loc_1.longitude, loc_2.latitude, loc_2.longitude)
            price = dist.to_i * 0.1 * 1.25
            render json: price.to_json()
        elsif params[:days_out] <= 30
            dist = distance_between(loc_1.latitude, loc_1.longitude, loc_2.latitude, loc_2.longitude)
            price = dist.to_i * 0.1 * 1.1
            render json: price.to_json()
        else
            dist = distance_between(loc_1.latitude, loc_1.longitude, loc_2.latitude, loc_2.longitude)
            price = dist.to_i * 0.1
            render json: price.to_json()
        end
    end

    EARTH_RADIUS = 6371.0
    KM_IN_MI = 0.621371192

    def distance_between(lat1, lon1, lat2, lon2, options = {})
        # set default options
        options[:units] ||= :mi

        # convert degrees to radians
        lat1, lon1, lat2, lon2 = to_radians(lat1, lon1, lat2, lon2)

        # compute deltas
        dlat = lat2 - lat1
        dlon = lon2 - lon1

        a = (Math.sin(dlat / 2))**2 + Math.cos(lat1) *
            (Math.sin(dlon / 2))**2 * Math.cos(lat2)
        c = 2 * Math.atan2( Math.sqrt(a), Math.sqrt(1-a))
        c * earth_radius(options[:units])
    end

    def to_radians(*args)
        args = args.first if args.first.is_a?(Array)
        if args.size == 1
          args.first * (Math::PI / 180)
        else
          args.map{ |i| to_radians(i) }
        end
    end

    def earth_radius(units = :mi)
        units == :km ? EARTH_RADIUS : to_miles(EARTH_RADIUS)
    end

    def to_miles(km)
        km * km_in_mi
    end

    def km_in_mi
        KM_IN_MI
    end

end
