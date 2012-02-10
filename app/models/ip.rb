class Ip < ActiveRecord::Base
  belongs_to :city
  validates :ip, :presence => true,:uniqueness => true
  before_create :get_ip
  def city_name
    self.city.try(:name)
  end
  def get_ip
    @get_ip = GetIp.new self.ip
    city = @get_ip.city
    unless city.blank?
      @city = City.find_by_name city
      self.city,self.lat,self.lon = @city,@city.lat,@city.lon if @city
    end
  end
end
