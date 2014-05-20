class CreateTripTypes < ActiveRecord::Migration
  def change
    create_table :trip_types do |t|

      t.timestamps
    end
  end
end
