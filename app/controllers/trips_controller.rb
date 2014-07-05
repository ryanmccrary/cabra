class TripsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @trips = Trip.all
  end
  def new
    if params[:group]
    @trip = Trip.new
    @group = Group.find(params[:group])
  else
    redirect_to groups_path, notice: "Select a group to make a trip"
  end
  end
  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to trips_path, notice: "Trip created successfully"
    else
      render "new"
    end
  end
  def show
    @trip = Trip.find(params[:id])
    @location = Location.find(@trip.location_id)
    @group = Group.find(@trip.group)
  end
  def edit
    @trip = Trip.find(params[:id])
  end
  def update
    @trip = Trip.find(params[:id])
    if @trip.update_attributes(trip_params)
      redirect_to trips_path, notice: "Trip successfully updated!"
    else
      render "edit"
    end
  end

    private

    def trip_params
      params.require(:trip).permit(:trip_type, :location, :group_id, 
                                  :scheduled_participants, :actual_participants,
                                  :plan_id, :pickup_time, :dropoff_time, 
                                  :date)
    end
end