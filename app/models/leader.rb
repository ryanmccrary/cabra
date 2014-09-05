class Leader < ActiveRecord::Base
  belongs_to :group
  has_many :plans
  has_many :leadernotes

  validates_presence_of :first_name, :last_name, :group_id

  def full_name
    first_name + " " + last_name
  end

end
