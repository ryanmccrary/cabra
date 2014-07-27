class Plan < ActiveRecord::Base
  belongs_to :group
  
  has_many :trips

  after_update :add_each_trip

  before_create :create_unique_id

  validates :unique_identifier, uniqueness: true

  def full_name
    first_name + " " + last_name
  end

  def to_param
    unique_identifier
  end

  def add_each_trip
    possible.each do |trip|
      trip.plan_id = self.id
    end
  end

  def create_unique_id
    begin
      self.unique_identifier = SecureRandom.urlsafe_base64(6).downcase
    end while self.class.exists?(:unique_identifier => unique_identifier)
  end

end
