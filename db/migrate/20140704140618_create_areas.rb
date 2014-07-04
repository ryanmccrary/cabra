class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.belongs_to :location
      t.belongs_to :trip

      t.timestamps
    end
  end
end
