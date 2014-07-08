class RenameTripTypesToActivities < ActiveRecord::Migration
  def change
    rename_table :trip_types, :activities
  end
end
