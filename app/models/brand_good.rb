class BrandGood < ActiveRecord::Base
  belongs_to :brand
  belongs_to :good
end
