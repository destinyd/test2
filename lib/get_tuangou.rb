# coding: utf-8
class GetTuangou
  require 'net/http'
  require 'xml'
  attr_accessor :last
  def initialize
    @tuan_urls =TuanUrl.where(:enable => true).includes(:tuan_api)
  end

  def get_all
    #log = Rails.logger
    #log.info "获取团购数据开始"
    @tuan_urls.each do |t|
      #log.info "开始获取#{t.name}的数据"
      uri = URI.parse t.url
      contents = get_contents_from_t_and_uri t,uri
      create contents if contents
      #log.info "获取#{t.name}的数据结束"
    end
    #log.info "获取团购数据结束"
  end

  def create contents
    Price.create contents
  end

  def get_contents_from_t_and_uri t,uri
    xml = get_xml uri
    return if xml.nil?
    #xml.gsub! /\n/,''
    doc = get_doc xml
    return if doc.nil?
    self.last = t.got_at 
    contents = get_contents doc,t
    if t.got_at.nil? or self.last > t.got_at
      t.got_at = self.last
      t.save
    end
    contents
  end

  def get_contents doc,t
    contents = []
    doc.find(t.docfind).each do |d|
      n = {}
      p = {}
      d.each{|a| n[a.name] = a.content}
      eval(t.suite)
      self.last = p[:started_at] if last.nil? or p[:started_at] > last 
      next if !t.got_at.nil? and p[:started_at] < t.got_at
      contents.push p
    end
    contents
  end

  def get_one dom,hashs
    result = {}
    hashs.each do |key,value|
      result[key] = dom.find(value.to_s).first.content if dom.find(value.to_s).first
    end
    result
  end

  def get_xml uri
    @error_times =0
    begin
      xml = Net::HTTP.get uri.host, uri.request_uri
    rescue #Timeout::Error
      if @error_times > 2
        @error_times =0
        return nil
      end
      @error_times += 1
      retry
    end
  end

  def get_doc xml
    begin
      parser = XML::Parser.string xml
      #parser = XML::Parser.file 'google.1'
      doc = parser.parse
    rescue
      #log.info "获取#{t.name}的数据失败"
      #next
    end
  end
end
