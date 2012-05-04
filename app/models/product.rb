class Product < ActiveRecord::Base
  attr_accessible :brand_id, :desc, :name
  validates :name, :presence => true
  belongs_to :brand
  has_many :goods
end
