class PriceGoods < ActiveRecord::Base
  attr_accessible :price_id, :good_id
  belongs_to :price
  belongs_to :good
end
