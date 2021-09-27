class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def create 
        if params[:activity_id]
            activity = Activity.find(params[:activity_id])
            signup = activity.signups.create(signup_params)
        else
            signup = Signup.create(signup_params)
        end
        render json: signup, include: :activity, status: :created 
    end

    private 

    def render_not_found_response
        render json: { error: signup.errors }, status: :unprocessable_entity
    end

    def signup_params
        params.permit(:time, :camper_id)
    end
end
