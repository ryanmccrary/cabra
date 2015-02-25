class AddLunchToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :lunch, :boolean
  end
end
