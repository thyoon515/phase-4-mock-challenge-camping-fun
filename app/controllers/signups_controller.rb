class SignupsController < ApplicationController

   def create
    signup = Signup.create(params.permit(:time, :camper_id, :activity_id))
        if signup.valid?
            render json: signup.activity, status: :created
        else
            render json: { errors: ["validation errors"] }, status: :unprocessable_entity
        end
    end

end
