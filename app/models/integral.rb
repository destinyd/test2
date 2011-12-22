class Integral < ActiveRecord::Base
  belongs_to :user
  belongs_to :integralable,:polymorphic => true
  scope :recent, select('integrals.*,sum(point) as points').order('points desc').group(:user_id).limit(10)
  scope :exp,where(:type_id => 0)
  scope :integral,where(:type_id => 1)
  scope :gold,where(:type_id => 2)
end
