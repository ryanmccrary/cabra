class ChangeTripTypeToActivityInTrips < ActiveRecord::Migration
  def change
    rename_column :trips, :trip_type, :activity
  end
end
