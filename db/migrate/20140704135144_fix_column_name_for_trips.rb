class FixColumnNameForTrips < ActiveRecord::Migration
  def change
    rename_column :trips, :location, :location_id
  end
end
