class Cost < ActiveRecord::Base
  belongs_to :user
  belongs_to :price
  belongs_to :locate
end
