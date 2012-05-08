class Company < ActiveRecord::Base
  attr_accessible :address, :desc, :email, :name, :phone, :user_id
  validates :name, :presence => true,:uniqueness => true
  validates :email, :presence => true
  validates :address, :presence => true
  has_many :brands
  # has_many :products
  # has_many :norms
  belongs_to :user
end
