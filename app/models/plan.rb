class Plan < ActiveRecord::Base
  belongs_to :group
  
  has_many :trips

  before_create :create_unique_id

  def create_unique_id
    begin
      self.unique_identifier = SecureRandom.urlsafe_base64(6).downcase
    end while self.class.exists?(:unique_identifier => unique_identifier)
  end
  
end
