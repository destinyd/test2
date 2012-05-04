class UserCost < ActiveRecord::Base
  attr_accessible :cost_id, :user_id
  belongs_to :cost
  belongs_to :user
end
