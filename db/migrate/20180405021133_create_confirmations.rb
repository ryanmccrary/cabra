class CreateConfirmations < ActiveRecord::Migration
  def change
    create_table :confirmations do |t|
      t.integer :plan_id
      t.string  :email

      t.timestamps null: false
    end
  end
end
