class PriceCost < ActiveRecord::Base
  attr_accessible :amount, :cost_id, :price_id
  belongs_to :price
  belongs_to :cost
end
