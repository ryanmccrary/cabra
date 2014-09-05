class CreateLeadernotes < ActiveRecord::Migration
  def change
    create_table :leadernotes do |t|
      t.integer :leader_id
      t.text :copy

      t.timestamps
    end

    add_index :leadernotes, :leader_id
  end
end
