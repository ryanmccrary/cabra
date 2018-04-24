class Confirmation < ActiveRecord::Base
  belongs_to :plan

  validates_presence_of :plan_id
  validates_presence_of :email

  validates :plan_id, uniqueness: true

  # before_save :ensure_not_confirmed

  # def ensure_not_confirmed
  #   return if self.plan.confirmed?
  # end
end
