class AddColumnsToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :group_id, :integer
    add_column :plans, :leader_id, :integer
  end
end
