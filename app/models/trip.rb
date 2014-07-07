class Trip < ActiveRecord::Base
  belongs_to :group
  belongs_to :plan

  has_one :trip_type

  default_scope order('date asc')

  validates_presence_of :group_id, :location_id
end
