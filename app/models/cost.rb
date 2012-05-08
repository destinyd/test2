class Cost < ActiveRecord::Base
  attr_accessor :name,:good_id,:address,:shop
  attr_accessible :name,:good_id,:price_id,:locate_id,:money,:shop_id
  validates :money, :presence => true
  belongs_to :user
  belongs_to :locate
  belongs_to :good
  belongs_to :shop
  belongs_to :cost
  has_many :costs
  has_many :user_costs,:dependent => :destroy
  has_many :users,:through => :user_costs
  has_many :price_costs,:dependent => :destroy
  has_many :price,:through => :price_costs
end
