class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Roles defined for cancancan (instead of adding roles model)
  ROLES = %i[admin regular reporter]

  has_many :leadernotes
end
