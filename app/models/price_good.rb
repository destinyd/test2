class PriceGood < ActiveRecord::Base
  attr_accessible :price_id, :good_id
  attr_accessor :good_name
  belongs_to :price
  belongs_to :good
  validates :name, :presence => true,:uniqueness => true
  validates :price_id, :presence => true, :uniqueness => { :scope => :good_id }
  validates :good_id, :presence => true
end
