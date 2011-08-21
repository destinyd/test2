class Integral < ActiveRecord::Base
  belongs_to :user
  belongs_to :integralable,:polymorphic => true
  scope :recent, select('integrals.*,sum(point) as points').order('points desc').group(:user_id).limit(10)
end
