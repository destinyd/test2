class Unit < ActiveRecord::Base
  attr_accessible :brand_id, :name
  validates :name, :presence => true
  has_many :goods
  belongs_to :brand
end

