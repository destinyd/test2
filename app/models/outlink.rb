# coding: utf-8
class Outlink < ActiveRecord::Base
  STATUS_LOW = 5
  belongs_to :outlinkable, :polymorphic => true
  belongs_to :user
  has_many :reviews, :as => :reviewable
  validates :url, :presence => true,:uniqueness =>{:scope => [:outlinkable_id, :outlinkable_type]}
  def human_link
    @status = self.reviews.sum(:status)
    if @status < STATUS_LOW
      read_attribute(:url) + '(待审)'
    else
      read_attribute(:url)
    end
  end
#  include Filter::ReviewPending
#  Filter.new(self).extend(ReviewPending)

end
