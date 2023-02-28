class ScientistsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_response_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_response_invalid

    def index 
        scientists = Scientist.all 
        render json: scientists, status: :ok
    end

    def show 
        scientist = find_scientist
        render json: scientist, serializer: ScientistShowSerializer, status: :ok
    end

    def create 
        scientist = Scientist.create!(scientist_params)
        render json: scientist, status: :created
    end

    def update 
        scientist = find_scientist
        scientist.update!(scientist_params)
        render json: scientist, status: :accepted
    end

    def destroy 
        scientist = find_scientist  
        scientist.destroy 
        head :no_content
    end


    private 

    def scientist_params 
        params.permit(:name, :field_of_study, :avatar)
    end

    def find_scientist 
        Scientist.find(params[:id])
    end

    def render_response_not_found
        render json: { error: "Scientist not found" }, status: :not_found
    end

    def render_response_invalid(exception)
        render json: { error: exception.record.errors.full_message }, status: :unprocessable_entity
    end

end
