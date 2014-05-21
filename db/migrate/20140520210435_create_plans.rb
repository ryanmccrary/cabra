class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :unique_identifier

      t.timestamps
    end

    add_index :unique_identifier
  end
end
