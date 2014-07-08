class ActivitiesController < ApplicationController 
  before_filter :authenticate_user!
  
  def index
    @activities = Activity.all
  end
  def new
    @activity = Activity.new
  end
  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to activities_path, notice: @activity.name + " successfully created"
    else
      render "new"
    end
  end

    private
    def activity_params
      params.require(:activity).permit(:name)
    end
end