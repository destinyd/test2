class PriceGood < ActiveRecord::Base
  attr_accessible :price_id, :good_id,:good_attributes
  belongs_to :price
  belongs_to :good
  belongs_to :user
  attr_accessor :good_name
  accepts_nested_attributes_for :good
  validates :price_id, :presence => true, :uniqueness => { :scope => :good_id }
end
