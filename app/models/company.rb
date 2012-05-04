class Company < ActiveRecord::Base
  attr_accessible :address, :desc, :email, :name, :phone, :user_id
  has_many :brands
  # has_many :products
  # has_many :norms
  belongs_to :user
end
