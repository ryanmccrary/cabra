class Trip < ActiveRecord::Base
  belongs_to :group
  belongs_to :plan
  has_many :locations, through: :areas

  has_one :trip_type

  validates_presence_of :group_id
end
