class ReportsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    @reports = Report.all
    @male = Report.all.sum(:male)
    @female = Report.all.sum(:female)

    @current_male = Report.current_year.sum(:male)
    @current_female = Report.current_year.sum(:female)
  end
  def new
    if params[:trip].present?
      @report = Report.new
      @trip = Trip.find(params[:trip])
    else
      redirect_to trips_path, notice: "You must select a trip to make a report!"
    end
  end
  def create
    @report = Report.new(report_params)
    if @report.save
      redirect_to trips_path, notice: "Trip report successfully filed"
    else
      render "new"
    end
  end
  def show
    @report = Report.find(params[:id])
    @trip = Trip.find(@report.trip)
  end

  private

  def report_params
    params.require(:report).permit(:trip_id, :user_id, :female, :male,
                                  :additional_guides, :weather, :incidents,
                                  :incident_needed, :updated_at)
  end

end
