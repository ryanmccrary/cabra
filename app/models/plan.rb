class Plan < ActiveRecord::Base
  belongs_to :group
  
  has_many :trips
end
