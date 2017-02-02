class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :trip_id
      t.integer :user_id
      t.integer :female
      t.integer :male
      t.string  :additional_guides
      t.text    :weather
      t.text    :incidents
      t.boolean :incident_needed

      t.timestamps
    end

    add_index :reports, :id
    add_index :reports, :trip_id

  end
end
