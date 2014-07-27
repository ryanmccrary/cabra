class PlansController < ApplicationController
  before_filter :authenticate_user!

  def index
    @plans = Plan.all
  end
  def new
    @plan = Plan.new
  end
  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      if @plan.trips.empty?
        @possible = @plan.group.trips
        render "add_trips"
      else
        redirect_to plans_path, notice: "Plan successfully created"
      end
    else
      render "new"
    end
  end
  def show
    @plan = Plan.find_by_unique_identifier(params[:id])
  end
  def update
    @plan = Plan.find_by_unique_identifier(params[:id])
    if @plan.update_attributes(plan_params)
      redirect_to plans_path, notice: "Plan successfully updated!"
    else
      render "edit"
    end
  end

    private

    def plan_params
      params.require(:plan).permit(:unique_identifier, :group_id, 
                                  :leader_id, :plan_sent)
    end
end
