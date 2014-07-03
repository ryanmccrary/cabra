class Leader < ActiveRecord::Base
  belongs_to :group

  validates_presence_of :first_name, :last_name, :group_id

end
