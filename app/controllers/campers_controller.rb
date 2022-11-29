class CampersController < ApplicationController

    def index
        render json: Camper.all, status: :ok
    end

    def show
        camper = Camper.find_by(id: params[:id])
        if camper
            render json: camper, serializer: CamperWithActivitiesSerializer
        else
            render json: { error: "Camper not found" }, status: :not_found
        end
    end

    def create
        camper = Camper.create(params.permit(:name, :age))
        if camper.valid?
            render json: camper, status: :created
        else
            render json: { errors: ["validation errors"] }, status: :unprocessable_entity
        end
    end
end
