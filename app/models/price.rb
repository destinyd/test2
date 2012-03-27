# coding: utf-8
class Price < ActiveRecord::Base
  STATUS_LOW = 5
  belongs_to :user
  validates :type_id, :presence => true
  validates :price, :presence => true
  attr_accessor :good_name,:good_user_id,:original_price,:is_cheap_price,:is_360,:city,:name,:title,:img
  attr_accessible :price,:type_id,:address,:amount,:good_name,:finish_at,:started_at,:name,:good_attributes,:outlinks_attributes,:longitude, :latitude,:original_price,:is_cheap_price,:is_360,:city,:title,:img

  has_many :outlinks, :as => :outlinkable, :dependent => :destroy
  has_many :integrals, :as => :integralable, :dependent => :destroy
  has_many :reviews, :as => :reviewable, :dependent => :destroy
  has_many :uploads, :as => :uploadable, :dependent => :destroy

  has_many :costs

  belongs_to :good
  belongs_to :brand
  accepts_nested_attributes_for :good
  accepts_nested_attributes_for :uploads
  accepts_nested_attributes_for :outlinks, :reject_if => lambda { |outlink| outlink[:url].blank? }, :allow_destroy => true

  default_scope includes(:good)

  scope :review_type, Filter.new(self).extend(ReviewTypeFilter)
  scope :review_low, Filter.new(self).extend(ReviewFilter)
  scope :truth,review_low(Review.truth_point)

  acts_as_commentable
  geocoded_by :address

  scope :running,where("finish_at > ? OR finish_at is null",Time.now)
  scope :cheapest,running.order("price")
  scope :recent,running.order("id desc")
  scope :groupbuy,recent.where(:type_id=>[21,22])
  scope :not_finish,where("finish_at > ?",Time.now)
 scope :costs,recent.where(:type_id=>[0,1])  
 scope :with_uploads,includes(:uploads)

  scope :you_like,running.order('rand()')
  TYPE = {
  0=>'消费',
  1=>'网上消费',
  6=>'特价',
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

  def no_locate?
    self.longitude.blank? or self.latitude.blank?
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
    return '不限量' if amount.nil?
    amount 
  end

  def human_finish_at
    return '不限时' if finish_at.nil?
    finish_at
  end

  def self.types
    TYPE
  end

  def self.selects
    TYPE.select{|k,v|k<31}.invert
  end

  def valid
    return if is_valid
    update_attribute(:is_valid, true)
    user.get_point(1,self,1) if user_id
  end

  def exp
    user.get_point(1,self) if user_id
  end

  def deal_cheap_price
    create_alias_price 6,price if !is_cheap_price.blank? and is_cheap_price != "0"
  end

  def deal_original_price
    create_alias_price 7,original_price unless original_price.blank?
  end

  def create_alias_price type_id,price
    p = Price.new :title => title,
      :type_id => type_id,
      :price => price,
      :address => address,
      :latitude => latitude,
      :longitude => longitude,
      :amount => amount
    outlinks.each do |outlink|
      o = Outlink.new :url => outlink.url
      o.user_id = outlink.user_id
      p.outlinks << o
    end
    p.user_id = user_id
    p.save
  end

  def near_prices long = 20
    return if no_locate?
    @nears ||= nearbys(long)
    @nears ||= @nears.running.limit(10) unless @nears == []
    @nears
  end

  def self.near_prices coordinates,long = 20
    Price.near(coordinates,long).running.limit(10)
  end

  def to_s
    if name
      case type_id
      when '团购价'
        name
      when '全国配送团购价'
        name
      else
        "(#{human_price})#{name}"
      end 
    else
      ""
    end
  end

  def could_post_good? user
    user and !goods.map(&:user_id).include?(user.id)
  end

  def is_tuangou?
    [21,22].include? read_attribute(:type_id)
  end

  def outlink_user
    outlinks.each do |outlink|
      outlink.user_id = user_id
    end
  end

  def name
    good.name if good
  end

  def desc 
    good.desc
  end

  after_validation :locate_by_city
  before_create :geocode, :if => [:no_locate?,:address_changed?]#,:on =>:create
  #before_update :geocode, :if => :address_changed?
  before_create :outlink_user
  after_create :exp,:deal_cheap_price,:deal_original_price,:deal_good,:deal_img
  private
  def locate_by_city
    if self.user_id.nil? and self.no_locate? and ! self.city.blank?
      if @locate = Locate.where(:name => self.city).first_or_create
        self.latitude = @locate.lat
        self.longitude = @locate.lon
      end
    end
  end
  
  def deal_good
    return if good_id
    tmp = Good.where(:name => title).first_or_create
    self.good_id = tmp.id  unless self.good_id
    save if changed?
  end

  def deal_img
    return if img.blank?
    good.uploads.first_or_create :image_file_name => img
    #self.good_id = tmp.id  unless self.good_id
    #save if changed?
  end
end
