# coding: utf-8
class GetTuangou
  require 'net/http'
  require 'xml'
  attr_accessor :last
  def initialize
    @tuan_urls =TuanUrl.enables
  end

  def get_all
    log = Rails.logger
    log.info "获取团购数据开始"
    @tuan_urls.each do |t|
      log.info "开始获取#{t.name}的数据"
      deal t
      log.info "获取#{t.name}的数据结束"
    end
    log.info "获取团购数据结束"
  end

  def deal t
    uri = URI.parse t.url
    get_contents_from_t_and_uri t,uri
  end

  def create contents
    Price.create contents
  end

  def get_contents_from_t_and_uri t,uri
    xml = get_xml uri
    return if xml.nil?
    doc = get_doc xml
    return if doc.nil?
    self.last = t.got_at 
    get_contents doc,t
    if t.got_at.nil? or self.last > t.got_at
      t.got_at = self.last
      t.save
    end
  end

  def get_contents doc,t
    doc.find(t.docfind).each do |d|
      p = get_p d,t
    end
  end

  def get_p d,t
    n = {}
    p = {}
    d.each{|a| n[a.name] = a.content}
    eval(t.suite)
    p[:type_id]=21 unless p[:address] == '全国'
    p[:type_id]=22 if p[:address] == '全国'
    p[:address] = '中国' if p[:address] == '全国'
    p[:finish_at]=Time.at(p[:finish_at].to_i) unless p[:is_360]
    p[:started_at]=Time.at(p[:started_at].to_i) unless p[:is_360]
    p[:title].gsub! /\n/,'' if p[:title]
    p[:title].strip if p[:title]
    p[:address].strip if p[:address]
    p[:desc].gsub! /\n/,'' if p[:desc]
    self.last = p[:started_at] if self.last.nil? or p[:started_at] > self.last 
    create p unless !t.got_at.nil? and p[:started_at] < t.got_at
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
      if @error_times > 1
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
      doc = parser.parse
    rescue
      log.info "获取#{t.name}的数据失败"
    end
  end
end
