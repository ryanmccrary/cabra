class Report < ActiveRecord::Base
  belongs_to :trip
  belongs_to :user

  scope :current_year, -> { where('extract(year from created_at) = ?', Time.zone.now.year) }
end
