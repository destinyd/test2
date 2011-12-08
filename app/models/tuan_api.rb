class TuanApi < ActiveRecord::Base
  has_many :tuan_urls
  validates :name,:presence => true,:uniqueness => true
  validates :docfind,:presence => true
  validates :suite,:presence => true
end
