class LocationsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @locations = Location.all
  end
  def new
    @location = Location.new
  end
  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to locations_path, notice: @location.name + " successfully created"
    else
      render "new"
    end
  end
  def show
    @location = Location.find(params[:id])
  end
  def edit
    @location = Location.find(params[:id])
  end
  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(location_params)
      redirect_to locations_path, notice: @location.name + " successfully updated!"
    else
      render "edit"
    end
  end

    private

    def location_params
      params.require(:location).permit(:name, :street, :city, 
                                    :state, :zip, :type_id)
    end
end