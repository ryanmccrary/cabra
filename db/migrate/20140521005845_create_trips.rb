class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :trip_type
      t.integer :location
      t.integer :group
      t.string :pickup_time
      t.string :dropoff_time
      t.datetime :date
      t.boolean :pickup

      t.timestamps
    end
  end
end
