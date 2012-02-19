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
<<<<<<< HEAD

  def to_s
    name
  end
=======
>>>>>>> ca2097107999e2fbf347d86a608174815640e84a
end
