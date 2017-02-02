class AddReportToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :report_id, :integer 
  end
end
