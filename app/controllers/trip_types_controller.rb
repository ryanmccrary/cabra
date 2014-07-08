class TripTypesController < ApplicationController 
  def index
    @trip_types = Trip_type.all
  end
  def new
    @trip_type = Trip_type.new
  end
  def create
    @trip_type = Trip_type.new(trip_type_params)
    if @trip_type.save
      redirect_to trip_types_path, notice: @trip_type.name + " successfully created"
    else
      render "new"
    end
  end

    private
    def trip_type_params
      params.require(:trip_type).permit(:name)
    end
end