class TravelersController < ApplicationController

    def create 
        if params[:name] != ""
            traveler =  Traveler.create(name:params[:name])
            render json: traveler.to_json()
        else
            create_message = "You must have a username"
            render json: create_message.to_json()
        end
    end

    def login
        if traveler = Traveler.find_by(name: params[:name])
            render json: traveler.to_json()
        else
            login_message = "No user found"
            render json: login_message.to_json()
        end
    end

    def update
        if params[:name] != ""
            traveler = Traveler.find(params[:id])
            traveler.update(name: params[:name])
            render json: traveler.to_json()
        else
            update_message = "You must enter a name to edit your profile"
            render json: update_message.to_json()
        end
    end

    def destroy
        traveler = Traveler.find(params[:id])
        traveler.destroy()
        delete_msg = "Your account has been deleted"
        render json: delete_msg.to_json()
    end

end
