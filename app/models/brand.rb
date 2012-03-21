class Brand < ActiveRecord::Base
  validates :name, :presence => true
  has_many :brand_goods,:dependent => :destroy
  has_many :goods,:through => :brand_goods
  has_many :prices
  belongs_to :user

  acts_as_taggable
end
