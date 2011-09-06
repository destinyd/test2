class Good < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :prices
  has_many :uploads, :as => :uploadable
  has_many :outlinks, :as => :outlinkable
  has_many :records, :as => :recordable
  has_many :uploads, :as => :uploadable
  has_many :focuss, :as => :focusable
  has_many :complaints, :as => :complaintable

  has_many :reviews, :as => :reviewable
  scope :review_type, Filter.new(self).extend(ReviewTypeFilter)

  validates :name, :presence => true
  
  acts_as_commentable

  default_scope order('id desc')#.includes(:prices) #

  scope :recent,limit(10)

  scope :get, lambda { |category_id|
  if category_id.nil? || category_id.blank?
    scoped
  else
    where(:category_id => category_id)
  end
  }

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

  def cheapest
    @cheapest = self.prices.min{|price| price.price}
    checapest_price = @cheapest.try(:price)
    checapest_price ||= "none"
  end

  def to_s
    self.name
  end

  has_many :integrals, :as => :integralable
  def valid
    return if self.is_valid
    self.update_attribute(:is_valid, true)
    self.user.get_point(5,self)
  end
  
end
