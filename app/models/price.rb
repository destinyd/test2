# coding: utf-8
class Price < ActiveRecord::Base
  STATUS_LOW = 5
  belongs_to :user
  belongs_to :good
  has_many :outlinks, :as => :outlinkable
  validates :type_id, :presence => true
  validates :price, :presence => true
  accepts_nested_attributes_for :good

  attr_accessor :good_name
  attr_accessible :price,:type_id,:address,:region_id,:amount,:good_name,:finish_at

  has_many :integrals, :as => :integralable
  has_many :reviews, :as => :reviewable
  has_many :uploads, :as => :uploadable
  scope :review_type, Filter.new(self).extend(ReviewTypeFilter)
  scope :review_low, Filter.new(self).extend(ReviewFilter)
  scope :truth,review_low(Review.truth_point)

  acts_as_commentable
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  before_create :valid_singleton_for_tuan

  scope :cheapest,order("price").limit(10)
  scope :recent,order("id desc").limit(10)

  #validates :country_code, :presence => true, :inclusion => { :in => Country.all_codes }
  #type [0:userlocal1day 1:userurl1day 2:团购 3:拍卖 10:商家普价 11:上架优惠 12:商家限量]

  TYPE = {
  0=>'本地单价',
  11=>'网络单价',
  21=>'团购价',
  31=>'批发价',
  51=>'成本价',
  101=>'商家发布价',
  102=>'商家优惠价',
  103=>'商家限量价'
  }


  def type_id
    t = read_attribute(:type_id)
    t  ||= 0
    TYPE[t]
  end

  def type_id=(value)
    write_attribute(:type_id, TYPE.key(value))
  end

  def human_price
    @status = self.reviews.sum(:status)
    if @status < STATUS_LOW
      read_attribute(:price).to_s + '(待审)'
    else
      read_attribute(:price)
    end
  end

  def human_amount
    return '不限量' if self.amount.nil?
    self.amount 
  end

  def human_finish_at
    return '不限时' if self.finish_at.nil?
    self.finish_at
  end

  def self.types
    TYPE
  end

  def self.selects
    TYPE.invert
  end

  def valid
    return if self.is_valid
    self.update_attribute(:is_valid, true)
    self.user.get_point(1,self)
  end

  def near_prices long = 2
    @nears = self.nearbys(long).limit(10)
    @nears.length > 0 ? @nears : @nears.where(:good_id => self.good_id).limit(10)
  end

  def to_s
    case self.type_id
    when 21
      self.title
    else
      "(#{human_price})#{self.title}"
    end
  end

  before_create  :valid_good
  private
  def valid_good
    if self.good_id.nil?
      self.good = Good.where(:name => self.good_name).first
      self.good = self.build_good(:name => self.good_name) if self.good.blank?
    end
  end

  def valid_singleton_for_tuan
    if self.type_id == 21 and !self.outlinks.blank?
      links = Outlink.where(:url => self.outlinks.map(&:url))
      self.errors.add(:url,'has') unless links.blank?
    end
  end

end
