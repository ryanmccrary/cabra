class AddUserToLeadernotes < ActiveRecord::Migration
  def change
    add_column :leadernotes, :user_id, :integer
  end
end
