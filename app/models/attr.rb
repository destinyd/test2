class Attr < ActiveRecord::Base
  belongs_to :attrable, :polymorphic => true
  validates :name,:presence => true
  validates :value,:presence => true
  validates :attrable_id,:presence => true
  validates :attrable_type,:presence => true
  scope :supported,where(:supported => true)
end
