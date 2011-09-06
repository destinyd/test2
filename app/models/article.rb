class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  acts_as_commentable

  default_scope order('is_top desc,id desc')
  scope :recent,limit(10)

  def to_s
    self.title
  end
  has_many :integrals, :as => :integralable
  has_many :complaints, :as => :complaintable

  has_many :reviews, :as => :reviewable
  scope :review_type, Filter.new(self).extend(ReviewTypeFilter)

#  accepts_nested_attributes_for :complaints

  def valid
    return if self.is_valid
    self.update_attribute(:is_valid, true)
    self.user.get_point(3,self)
  end
end
