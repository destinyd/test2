class Ip < ActiveRecord::Base
  validates :ip, :presence => true,:uniqueness => true
end
