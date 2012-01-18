class Province < ActiveRecord::Base
  has_many :cities
  geocoded_by :name, :latitude  => :lat, :longitude => :lon
  #after_validation :geocode
end
