class MissionsController < ApplicationController
   
    def create
        mission = Mission.create(mission_params)
        if mission
            render json: mission, status: :created
        else
            render json: { errors: mission.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private 

    def mission_params 
        params.permit(:name, :distance_from_earth, :nearest_star, :image)
    end
end
