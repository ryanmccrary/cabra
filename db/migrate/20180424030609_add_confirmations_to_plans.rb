class AddConfirmationsToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :confirmation, :datetime
    add_column :plans, :confirmation_email, :string
  end
end
