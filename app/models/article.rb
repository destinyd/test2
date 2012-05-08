# coding: utf-8
class Article < ActiveRecord::Base
  STATUS_LOW = 2
  acts_as_commentable

  validates :title, :presence => true,:uniqueness => true

  default_scope order('articles.is_top desc,articles.id desc')
  scope :recent,limit(10)
  scope :review_type, Filter.new(self).extend(ReviewTypeFilter)
  scope :review_low, Filter.new(self).extend(ReviewFilter)
  scope :truth,review_low(Review.truth_point)

  belongs_to :user
  has_many :integrals, :as => :integralable
  has_many :reviews, :as => :reviewable


  def to_s
    return self.title if self.is_valid
    @status = self.reviews.sum(:status)
    if @status < STATUS_LOW
      self.title + '(待审)'
    else
      self.title
    end

  end

  def valid
    return if self.is_valid
    self.update_attribute(:is_valid, true)
    self.user.get_point(3,self)
  end
end
