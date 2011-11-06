# coding: utf-8
class Get_tuangou
  def initialize(args)
    @tuan_apis =TuanApi.where(:enable => true)
  end

  def get_all
    require 'net/http'
    require 'xml'
    log = Rails.logger
    log.info "获取团购数据开始"
    @tuan_apis.each do |t|
      log.info "开始获取#{t.name}的数据"
      uri = URI.parse t.url
      Net::HTTP.start(uri.host) do |http|
        xml = http.get(uri.path)
        parser, parser.string = XML::Parser.new, xml
        doc, posts = parser.parse, []
        doc.find(t.docfind).each do |d|
          eval(t.suite)
        end
      end
      log.info "获取#{t.name}的数据结束"
    end
    log.info "获取团购数据结束"
  end
end


