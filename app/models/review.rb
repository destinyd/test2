class Review < ActiveRecord::Base
  belongs_to :reviewable, :polymorphic => true
  belongs_to :user
  validates :desc, :presence => true
  validates :type_id, :presence => true
end
