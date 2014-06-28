class TripsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @trips = Trip.all
  end
  def new
    @trip = Trip.new
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
    
  end
  def edit
    
  end
  def update
    
  end

    private

    def trip_params
      params.require(:trip).permit(:trip_type, :location, :group, 
                                  :scheduled_participants, :actual_participants,
                                  :plan_id, :pickup_time, :dropoff_time, 
                                  :date)
    end
end