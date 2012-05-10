class Product < ActiveRecord::Base
  attr_accessible :brand_id, :desc, :name,:tag_list
  validates :name, :presence => true
  belongs_to :brand
  has_many :goods
  acts_as_taggable
end
