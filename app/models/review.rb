class Review < ActiveRecord::Base
  belongs_to :reviewable, :polymorphic => true
  belongs_to :user
  #validates :desc, :presence => true
  validates :status, :presence => true
  def up(reviewable)
    self.status = 1
    self.reviewable = reviewable
    self.user = current_user
    self.save
  end
end
