class Brand < ActiveRecord::Base
  validates :name, :presence => true
  has_many :brand_goods,:dependent => :destroy
  has_many :goods,:through => :brand_goods
  belongs_to :user
end
