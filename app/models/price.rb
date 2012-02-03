# coding: utf-8
class Price < ActiveRecord::Base
  STATUS_LOW = 5
  belongs_to :user
#  belongs_to :good
  has_many :outlinks, :as => :outlinkable, :dependent => :destroy
  validates :type_id, :presence => true
  validates :price, :presence => true
  validates :title, :presence => true
  
  validates :title, :uniqueness =>true,# { :scope => [:finish_at,:address,#:price 不知道为什么 falut
  #] } ,
  :if => :is_tuangou? #,:on => :create #限制 当创建的时候

  attr_accessor :good_name,:good_user_id
  attr_accessible :price,:type_id,:address,:region_id,:amount,:good_name,:finish_at,:started_at,:title,:desc,:good_attributes,:uploads_attributes,:outlinks_attributes,:longitude, :latitude

  has_many :integrals, :as => :integralable, :dependent => :destroy
  has_many :reviews, :as => :reviewable, :dependent => :destroy
  has_many :uploads, :as => :uploadable, :dependent => :destroy

  has_many :price_goods, :dependent => :destroy
  has_many :goods, :through => :price_goods
  accepts_nested_attributes_for :goods
  accepts_nested_attributes_for :uploads
  accepts_nested_attributes_for :outlinks

  scope :review_type, Filter.new(self).extend(ReviewTypeFilter)
  scope :review_low, Filter.new(self).extend(ReviewFilter)
  scope :truth,review_low(Review.truth_point)

  acts_as_commentable
  geocoded_by :address
  before_create :geocode, :if => [:is_not_locate?,:address_changed?]#,:on =>:create
  before_update :geocode, :if => :address_changed?#,:on =>:create
  #after_validation :geocode, :if => :address_changed?,:on =>:update
  #before_create :valid_singleton_for_tuan

  scope :running,where("finish_at > ? OR finish_at is null",Time.now)
  scope :cheapest,running.order("price")
  scope :recent,running.order("id desc")
  scope :groupbuy,recent.where(:type_id=>[21,22])
  scope :not_finish,where("finish_at > ?",Time.now)
  scope :just_started,not_finish.order("id desc")
  scope :nearly_finish,not_finish.order(:finish_at)
  scope :costs,recent.where(:type_id=>0..20)#.includes(:reviews)
  #scope :nearest,running.near_prices
  scope :with_uploads,includes(:uploads)

  scope :you_like,running.order('rand()')#.includes(:reviews)

  #type [0:userlocal1day 1:userurl1day 2:团购 3:拍卖 10:商家普价 11:上架优惠 12:商家限量]

  TYPE = {
  0=>'消费',
  1=>'网上消费',
  6=>'折扣价/特价/促销价',
  7=>'商品标示原价',
  11=>'商家叫价',
  21=>'团购价',
  22=>'全国配送团购价',
  31=>'批发价',
  51=>'成本价',
  #101=>'商家发布价',
  #102=>'商家优惠价',
  #103=>'商家限量价'
  }

  def is_not_locate?
    self.longitude.nil? or self.latitude.nil?
  end

  def type_id
    t = read_attribute(:type_id)
    TYPE[t]
  end

  #def type_id=(value)
    #write_attribute(:type_id, TYPE.key(value))
  #end

  def human_price
    #return self.price.to_s + '元' + '(待审)' if self.type_id !='团购价' or self.is_valid.nil?# and self.reviews.sum(:status) < STATUS_LOW
    self.price.to_s + '元'
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
    TYPE.select{|k,v|k<31}.invert
  end

  def valid
    return if self.is_valid
    self.update_attribute(:is_valid, true)
    self.user.get_point(1,self) if self.user_id
  end

  def near_prices long = 20
    @nears = self.nearbys(long).running.limit(10)
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

  def is_tuangou?
    [21,22].include? self.read_attribute(:type_id)
  end

  before_save  :valid_good
  after_create :valid
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

  #def valid_singleton_for_tuan
    #if self.type_id == '团购价'
      #links = Outlink.where(:url => self.outlinks.map(&:url))
      #self.errors.add(:url,'has') unless links.blank?
    #end
  #end


end
