class Focus < ActiveRecord::Base
  attr_accessible :focusable_id, :focusable_type,:user_id
  belongs_to :focusable, :polymorphic => true
  validates :focusable_id, :presence => true
  validates :focusable_type, :presence => true
  validates :user_id, :presence => true
  
  scope :most, :select => 'focusable_id,focusable_type,count(*) as count',:group => 'focusable_id,focusable_type'
  
  def to_s
    focus.focusable.to_s
  end
  
  def to_most_s
    "#{self.focusable}(#{self.count})"
  end

end
