class Shop < ActiveRecord::Base
  attr_accessible :desc, :name,:lat,:lon,:brand_id,:address
  validates :name, :presence => true
  validates :address, :presence => true

  belongs_to :user
  belongs_to :brand
  has_many :shop_goods,:dependent => :destroy
  has_many :goods,:through => :shop_goods
  has_many :prices
  has_many :costs

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
