class Location < ActiveRecord::Base
  has_many :areas
  has_many :trips, through: :areas

  def full_address
    street + " " + city + " " + state + " " + zip
  end

end
