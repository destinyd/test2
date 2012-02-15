class Shop < ActiveRecord::Base
  validates :name, :presence => true
  validates :address, :presence => true
  has_many :shop_goods,:dependent => :destroy
  has_many :goods,:through => :shop_goods
  geocoded_by :address, :latitude  => :lat, :longitude => :lon
  after_validation :geocode, :if => [:no_locate?,:address_changed?]#,:on =>:create

  def no_locate?
    self.lat.nil? or self.lon.nil?
  end
end
