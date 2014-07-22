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
      redirect_to plans_path, notice: "Plan successfully created"
    else
      render "new"
    end
  end
  def show
    @plan = Plan.find_by_unique_identifier(params[:id])
  end

    private

    def plan_params
      params.require(:plan).permit(:unique_identifier, :group_id, 
                                  :leader_id, :plan_sent)
    end
end
