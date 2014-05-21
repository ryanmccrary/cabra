class CreateLeaders < ActiveRecord::Migration
  def change
    create_table :leaders do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :telephone
      t.integer :group_id

      t.timestamps
    end
  end
end
