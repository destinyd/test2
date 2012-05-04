class Brand < ActiveRecord::Base
  validates :name, :presence => true
  belongs_to :user
  belongs_to :company
  has_many :brand_goods,:dependent => :destroy
  has_many :goods,:through => :brand_goods
  has_many :prices
  has_many :shops
  has_many :costs
  has_many :products
  has_many :norms

  acts_as_taggable
end
