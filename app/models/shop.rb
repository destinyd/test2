class Shop < ActiveRecord::Base
  validates :name, :presence => true
  validates :address, :presence => true

  has_many :shop_goods,:dependent => :destroy
  has_many :goods,:through => :shop_goods
  belongs_to :user

  geocoded_by :address, :latitude  => :lat, :longitude => :lon
  after_validation :geocode, :if => [:no_locate?,:address_changed?]#,:on =>:create

  acts_as_taggable

  def no_locate?
    self.lat.nil? or self.lon.nil?
  end

  def to_s
    name
  end
end
