class GetIp
  require 'net/http'
  attr_accessor :ip,:json
  def initialize ip
    @ip = ip
    @uri = URI.parse "http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json&ip=#{@ip}"
  end

  def city
    get_content
    @city = @json["city"]
  end
  def get_content 
    return if @json
    @log = Rails.logger
    start = Time.now
    body = Net::HTTP.get @uri.host,@uri.request_uri
    @json = JSON.parse body
    finish = Time.now
    @log.info "get #{self.ip} city info,cost #{finish-start} s"
  end
end

