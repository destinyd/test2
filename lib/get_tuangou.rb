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
    @error_times =0
    @tuan_urls.each do |t|
      log.info "开始获取#{t.name}的数据"
      uri = URI.parse t.url
      begin
        xml = Net::HTTP.get uri.host, uri.request_uri
      rescue Timeout::Error
        if @error_times > 2
          @error_times =0
          next
        end
        @error_times += 1
        retry
      end
      xml.gsub! /\n/,''
      begin
      parser = XML::Parser.string xml
      doc = parser.parse
      rescue
        log.info "获取#{t.name}的数据失败"
        next
      end
      arr = []
      last = t.got_at 
      doc.find(t.docfind).each do |d|
        n = {}
        d.each{|a| n[a.name] = a.content}
        p = {}
        eval(t.suite)
        last = p[:started_at] if last.nil? or p[:started_at] > last 
        next if !t.got_at.nil? and p[:started_at] < t.got_at
        arr.push p
      end
      t.got_at = last
      Price.create arr
      t.save
      log.info "获取#{t.name}的数据结束"
    end
    log.info "获取团购数据结束"
  end
end
