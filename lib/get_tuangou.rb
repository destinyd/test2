# coding: utf-8
class GetTuangou
  require 'net/http'
  require 'xml'
  def initialize
    @tuan_urls =TuanUrl.where(:enable => true).includes(:tuan_api)
  end

  def get_all
    log = Rails.logger
    log.info "获取团购数据开始"
    @tuan_urls.each do |t|
      log.info "开始获取#{t.name}的数据"
      uri = URI.parse t.url
      xml = Net::HTTP.get uri.host, uri.request_uri
      begin
      parser, parser.string = XML::Parser.new, xml
      doc = parser.parse
      rescue
        log.info "获取#{t.name}的数据失败"
        next
      end
      arr = []
      doc.find(t.docfind).each do |d|
        n = {}
        d.each{|a| n[a.name] = a.content}
        p = {}
#        suite = "d = d.find('//data/display').first;d.each{|a| n[a.name] = a.content};p.price = n['price'];p.type_id = 21;p.finish_at = n['endTime'].to_i;p.address = n['city'];p.title=n['title'];o = p.outlinks.new;o.url = n['loc'];"
#        eval(suite)
        eval(t.suite)
        #p.save
        arr.push p
      end
      Price.create arr
      log.info "获取#{t.name}的数据结束"
    end
    log.info "获取团购数据结束"
  end
end
      debugger


