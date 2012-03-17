class Cost < ActiveRecord::Base
  belongs_to :user
  belongs_to :price
  belongs_to :locate
  belongs_to :good
  #accepts_nested_attributes_for :good
  #alias good_attributes good
  #accepts_nested_attributes_for :locate
  #accepts_nested_attributes_for :price
  attr_accessor :name,:good_id,:address,:shop
  attr_accessible :name,:good_id,:price_id,:locate_id,:price,:shop_id
#  alias_method :price=, :price_attributes=
#  attr_accessible :price,:good_id,:price_id,:locate_id
end
