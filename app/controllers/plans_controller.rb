class PlansController < ApplicationController
  before_filter :authenticate_user!, except: [:show]


  layout :public_layout

  def index
    @plans = Plan.all.order('created_at DESC')
  end
  def new
    @plan = Plan.new
  end
  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      if @plan.trips.empty?
        @possible = @plan.group.trips.adding_trips
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
    @trips = @plan.trips.order('date ASC')
  end
  def edit
    @plan = Plan.find_by_unique_identifier(params[:id])
    @group = @plan.group
    @possible = @plan.group.trips.adding_trips
    render "add_trips"
  end
  def update
    @plan = Plan.find_by_unique_identifier(params[:id])
    if @plan.update_attributes(plan_params)
      redirect_to plans_path, notice: "Plan successfully updated!"
    else
      render "edit"
    end
  end
  def add_trips
    @plan = Plan.find_by_unique_identifier(params[:id])
    if params[:trips]
      @trips = Trip.find(params[:trips])
      @trips.each do |trip|
        trip.update_attributes(plan_id: @plan.id)
      end
      redirect_to plan_path(@plan), notice: "Trips added to #{@plan.leader.full_name} plan for #{@plan.group.name} (Plan id: #{@plan.unique_identifier})"
    else
      redirect_to plans_path, notice: "No trips added to #{@plan.leader.full_name} plan for #{@plan.group.name} (Plan id: #{@plan.unique_identifier})"
    end
  end
  def destroy
    @plan = Plan.find_by_unique_identifier(params[:id])
    @plan.destroy
    redirect_to plans_path, notice: "Plan destroyed"
  end

    private

    def plan_params
      params.require(:plan).permit(:unique_identifier, :group_id,
                                  :leader_id, :plan_sent)
    end

    def public_layout
      if user_signed_in?
        "application"
      else
        "public"
      end
    end
end
