class ConfirmationsController < ApplicationController
  before_filter :authenticate_user!, except: [:new, :create]

  def new
    @plan = Plan.find_by_unique_identifier(params[:plan_id])
    @trips = @plan.trips.order('date ASC')
    @confirmation = Confirmation.new
  end

  def create
    @plan = Plan.find_by_unique_identifier(params[:plan_id])
    @confirmation = Confirmation.new(email: params[:confirmation][:email], plan_id: @plan.id)
    if @confirmation.save
      flash[:notice] = 'Thank you for confirming your trips, they have been added to our calendar! Please keep this link for your reference'
      redirect_to plan_path(@plan)
    else
      flash[:notice] = "This plan has already been confirmed by #{@plan.confirmation.email}"
      redirect_to plan_path(@plan)
    end
  end

  def confirmation_params
      params.require(:confirmation).permit(:plan_id, :email)
    end

end
