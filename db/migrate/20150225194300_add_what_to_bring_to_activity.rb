class AddWhatToBringToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :whattobring, :string
  end
end
