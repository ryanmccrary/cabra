class PlansController < ApplicationController
  before_filter :authenticate_user!

  def new
    @plan = Plan.new
  end
  def create
    @plan = Plan.new(plan_params)
  end

    private

    def plan_params
      params.require(:plan).permit(:unique_identifier, :group_id, 
                                  :leader_id, :plan_sent)
    end
end
