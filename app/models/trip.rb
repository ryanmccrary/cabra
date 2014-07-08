class Trip < ActiveRecord::Base
  belongs_to :group
  belongs_to :plan
  belongs_to :location
  belongs_to :activity

  default_scope order('date asc')

  validates_presence_of :group_id, :location_id
end
