class ReportsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    @reports = Report.all
  end
  def new
    @report = Report.new
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
  end

  private

  def report_params
    params.require(:report).permit(:trip_id, :user_id, :female, :male,
                                  :additional_guides, :weather, :incidents,
                                  :incident_needed, :updated_at)
  end

end
