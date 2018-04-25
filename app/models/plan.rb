class Plan < ActiveRecord::Base
  belongs_to :group
  belongs_to :leader

  has_many :trips

  before_create :create_unique_id

  validates :unique_identifier, uniqueness: true

  validates_presence_of :group, :leader

  def confirmed?
    self.confirmation?
  end

  def full_name
    first_name + " " + last_name
  end

  def to_param
    unique_identifier
  end

  def create_unique_id
    begin
      self.unique_identifier = SecureRandom.urlsafe_base64(6).downcase
    end while self.class.exists?(:unique_identifier => unique_identifier)
  end

end
