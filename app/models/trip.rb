class Trip < ActiveRecord::Base
  belongs_to :group
  belongs_to :plan
  belongs_to :location
  belongs_to :activity

  has_one :report

  delegate :confirmation, to: :plan
  delegate :full_address, to: :location

  scope :future, -> { where("date > ?", Date.today) }
  scope :past, -> { where("date <= ?", Date.today) }
  scope :year, -> { where("extract(year from date) = ?", Date.today.year) }
  scope :need_report, -> { select { |trip| trip.report.blank? } }
  scope :adding_trips, -> { where("plan_id IS ?", nil) }

  validates_presence_of :date, :group_id, :location_id, :activity_id, :pickup_time, :dropoff_time

  def confirmed?
    false == self.confirmation.nil?
  end

  def google_static_image
    "http://maps.googleapis.com/maps/api/staticmap?maptype=roadmap&sensor=false \
    &center=Greenville%20SC&size=500x300 \
    &markers=color:green%7CGreenville%20SC \
    &markers=color:red%7Clabel:G%7C#{self.full_address} \
    &key=#{ENV['GOOGLE_MAPS_API_KEY']}"
  end
end
