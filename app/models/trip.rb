class Trip < ActiveRecord::Base
  belongs_to :group
  belongs_to :plan
  belongs_to :location
  belongs_to :activity

  has_one :report

  scope :future, -> { where("date > ?", Date.today) }

  scope :past, -> { where("date <= ?", Date.today) }

  scope :need_report, -> { select { |trip| trip.report.blank? } }

  scope :adding_trips, -> { where("plan_id IS ?", nil) }

  validates_presence_of :group_id, :location_id, :activity_id, :pickup_time, :dropoff_time
end
