sql = "delete from outlinks where url like 'http://www.55tuan.com/backUrlUTF8.do?%';"
ActiveRecord::Base.connection.execute(sql)

t = TuanUrl.find_by_name '窝窝团360'
uri = URI.parse t.url
gt = GetTuangou.new
xml = gt.get_xml uri
doc = get_doc xml

doc.find(t.docfind).each do |d|
  title = d.find('title').first.try(:content)
  url = d.find('goods_url').first.try(:content)
  if title and url
    prices = Price.where :title => title
    prices.each do |price|
      price.outlinks << Outlink.create(:url => url) unless price.outlinks.map(&:url).include? url
      price.save
    end
  end
end
