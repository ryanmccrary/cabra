class Trips < ActiveRecord::Base
  belongs_to :group
  belongs_to :plan

  has_one :trip_type
end
