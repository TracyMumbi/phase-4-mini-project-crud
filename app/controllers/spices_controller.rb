class SpicesController < ApplicationController

    wrap_parameters format: []
    def index
        spices = Spice.all
        render json: spices
    end
    def create
        spices = Spice.create(spices_params)
        render json: spices, status: :created
    end
    def update
        spices = Spice.find_by(id: params[:id])
        spices.update(spices_params)
        render json: spices
    end
    def destroy
        spices = Spice.find_by(id: params[:id])
        spices.destroy
        head :no_content
    end

    private
    def spices_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
end
