# coding: utf-8
class Review < ActiveRecord::Base
  STATUS_TYPES = {
    1 => '+1',
    -1 => '踩',-2 => '内容不符', -5 => '有敏感内容'
  }
  belongs_to :reviewable, :polymorphic => true
  belongs_to :user
  #validates :desc, :presence => true
  validates :status, :presence => true
  scope :reviewed_by, proc{|user| where(:user_id => user)}

  def self.types
    STATUS_TYPES
  end

  def self.selects
    types.invert
  end

  def self.truth_point
    0
  end

  def up(user)
    self.status = 1
    self.user = user
    self.save
  end
end
