# coding: utf-8
class Article < ActiveRecord::Base
  STATUS_LOW = 2
  belongs_to :user
  acts_as_commentable

  default_scope order('articles.is_top desc,articles.id desc')
  scope :recent,limit(10)
  validates :title, :presence => true,:uniqueness => true

  def to_s
    return self.title if self.is_valid
    @status = self.reviews.sum(:status)
    if @status < STATUS_LOW
      self.title + '(待审)'
    else
      self.title
    end

  end
  has_many :integrals, :as => :integralable

  has_many :reviews, :as => :reviewable
  scope :review_type, Filter.new(self).extend(ReviewTypeFilter)
  scope :review_low, Filter.new(self).extend(ReviewFilter)
  scope :truth,review_low(Review.truth_point)

  def valid
    return if self.is_valid
    self.update_attribute(:is_valid, true)
    self.user.get_point(3,self)
  end
end
