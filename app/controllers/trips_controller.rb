class TripsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    if current_user.roles_mask === 4
      params[:type] = "need_report"
    end
    if current_user.roles_mask === nil
      params[:type] = "need_report"
    end
    @trips = Trip.future.paginate(page: params[:page], per_page: 20).order('date ASC')
    @trips_past = Trip.past.paginate(page: params[:page], per_page: 20).order('date DESC')
    @trips_need = Trip.year.past.paginate(page: params[:page], per_page: 20).order('date DESC').need_report
    @groups = Group.all.order('name ASC')
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
  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to trips_path, notice: "Trip deleted."
  end

    private

    def trip_params
      params.require(:trip).permit(:activity_id, :location_id, :group_id,
                                  :scheduled_participants, :actual_participants,
                                  :plan_id, :pickup, :pickup_time, :dropoff_time,
                                  :date, :lunch)
    end
end
