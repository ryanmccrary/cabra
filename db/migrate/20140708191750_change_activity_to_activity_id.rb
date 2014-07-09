class ChangeActivityToActivityId < ActiveRecord::Migration
  def change
    rename_column :trips, :activity, :activity_id
  end
end
