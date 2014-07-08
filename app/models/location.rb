class Location < ActiveRecord::Base
  has_many :trips

  def full_address
    street + " " + city + " " + state + " " + zip
  end

end
