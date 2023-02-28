class MissionsController < ApplicationController
   
    def create
        mission = Mission.create(:name, :distance_from_earth, :nearest_star, :image)
        if mission
            render json: mission, status: :created
        else
            render json: { errors: 'Validation Error'}, status: :unprocessable_entity
        end

    end
    
end
