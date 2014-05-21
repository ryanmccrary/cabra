class CreateTripTypes < ActiveRecord::Migration
  def change
    create_table :trip_types do |t|
      t.string :name

      t.timestamps
    end

    add_index :trip_types, :name, unique: true
  end
end
