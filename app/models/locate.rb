class Locate < ActiveRecord::Base
  validates :name, :uniqueness =>true
  geocoded_by :name, :latitude  => :lat, :longitude => :lon

  has_many :costs

  after_validation do
    self.geocode unless self.lat and self.lon
  end
  def prices
    Price.near(self,20)
  end
  def to_s
    self.name
  end
end
