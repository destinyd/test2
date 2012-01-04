# coding: utf-8
class Price < ActiveRecord::Base
  STATUS_LOW = 5
  belongs_to :user
#  belongs_to :good
  has_many :outlinks, :as => :outlinkable
  validates :type_id, :presence => true
  validates :price, :presence => true
  validates :title, :presence => true
  
  validates :title, :uniqueness => { :scope => [:finish_at,:price,:address] } ,:if => :is_tuangou? #限制 当创建的时候

  attr_accessor :good_name,:good_user_id
  attr_accessible :price,:type_id,:address,:region_id,:amount,:good_name,:finish_at,:title,:desc,:good_attributes,:uploads_attributes,:outlinks_attributes

  has_many :integrals, :as => :integralable
  has_many :reviews, :as => :reviewable
  has_many :uploads, :as => :uploadable

  has_many :price_goods
  has_many :goods, :through => :price_goods
  accepts_nested_attributes_for :goods
  accepts_nested_attributes_for :uploads
  accepts_nested_attributes_for :outlinks

  scope :review_type, Filter.new(self).extend(ReviewTypeFilter)
  scope :review_low, Filter.new(self).extend(ReviewFilter)
  scope :truth,review_low(Review.truth_point)

  acts_as_commentable
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  #before_create :valid_singleton_for_tuan

  scope :running,where("finish_at > ?",Time.now)
  scope :cheapest,running.order("price").limit(10)
  scope :recent,running.order("id desc").limit(10)

  #validates :country_code, :presence => true, :inclusion => { :in => Country.all_codes }
  #type [0:userlocal1day 1:userurl1day 2:团购 3:拍卖 10:商家普价 11:上架优惠 12:商家限量]

  TYPE = {
  -1=>'记账',
  0=>'本地单价',
  1=>'折扣价',
  11=>'网络单价',
  21=>'团购价',
  31=>'批发价',
  51=>'成本价',
  #101=>'商家发布价',
  #102=>'商家优惠价',
  #103=>'商家限量价'
  }


  def type_id
    t = read_attribute(:type_id)
    TYPE[t]
  end

  #def type_id=(value)
    #write_attribute(:type_id, TYPE.key(value))
  #end

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
    @nears = self.nearbys(long)
    if @nears.length != 0
      good_nears = @nears.where(:good_id => self.good_id).limit(10)
      return good_nears if good_nears.length > 0
    end
    @nears.limit(10) if @nears.length > 0
  end

  def to_s
    case self.type_id
    when '团购价'
      self.title
    else
      "(#{human_price})#{self.title}"
    end
  end

  def could_post_good? user
    user and !self.goods.map(&:user_id).include?(user.id)
  end

  before_save  :valid_good
  private
  def valid_good
    if self.good_name
      good = Good.where(:name => self.good_name).first
      if good
        if self.goods.include? good
          self.errors.add(:goods,"has_post") 
          return false
        else
          self.goods <<  good
        end
      else
        self.goods << self.goods.new(:name => self.good_name,:user_id => self.good_user_id) 
      end
    end
  end

  def is_tuangou?
    self.read_attribute(:type_id) == 21
  end

  #def valid_singleton_for_tuan
    #if self.type_id == '团购价'
      #links = Outlink.where(:url => self.outlinks.map(&:url))
      #self.errors.add(:url,'has') unless links.blank?
    #end
  #end


end
