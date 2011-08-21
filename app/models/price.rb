# coding: utf-8
class Price < ActiveRecord::Base
  belongs_to :user
  belongs_to :good
  has_many :outlinks, :as => :outlinkable
  validates :type_id, :presence => true
  validates :price, :presence => true

  acts_as_commentable

  default_scope order('price asc,finish_at desc,created_at desc')
  scope :cheapest,order("price desc").limit(10).includes(:good)

  #validates :country_code, :presence => true, :inclusion => { :in => Country.all_codes }
  #type [0:userlocal1day 1:userurl1day 2:团购 3:拍卖 10:商家普价 11:上架优惠 12:商家限量]

  TYPE = %w(
  本地单价
  网络单价
  团购价
  批发价
  成本价
  商家发布价
  商家优惠价
  商家限量价
  )


  def type_id
    t = read_attribute(:type_id)
    t  ||= 0
    TYPE[t]
  end

  def type_id=(value)
    write_attribute(:type_id, TYPE.index(value))
  end

  def self.types
    TYPE
  end

  has_many :integrals, :as => :integralable
  def valid
    return if self.is_valid
    self.update_attribute(:is_valid, true)
    self.user.get_point(1,self)
  end

end
