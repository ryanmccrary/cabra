class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :zip


      t.timestamps
    end

    add_index :groups, :name, unique: true
  end
end
