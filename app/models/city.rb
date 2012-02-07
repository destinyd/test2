class City < ActiveRecord::Base
  belongs_to  :province
  has_many    :areas
  geocoded_by :name, :latitude  => :lat, :longitude => :lon
  #after_validation :geocode
  def prices
    Price.near(self,20)
  end
  def to_param
    self.name
  end
  def to_s
    self.name
  end
end
