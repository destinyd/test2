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
      if @city
        self.city = @city
        self.lat = @city.lat
        self.lon = @city.lon
      end
    end
  end
end
