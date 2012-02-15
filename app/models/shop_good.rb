class ShopGood < ActiveRecord::Base
  belongs_to :shop
  belongs_to :good
end
