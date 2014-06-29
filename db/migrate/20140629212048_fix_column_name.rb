class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :trips, :group, :group_id
  end
end
