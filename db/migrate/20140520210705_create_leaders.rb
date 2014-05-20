class CreateLeaders < ActiveRecord::Migration
  def change
    create_table :leaders do |t|

      t.timestamps
    end
  end
end
