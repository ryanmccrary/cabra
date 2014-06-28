class Group < ActiveRecord::Base
  has_many :plans
  has_many :trips
  has_many :leaders
  has_many :students

end
