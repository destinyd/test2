# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
TuanApi.create [
  {
  :name => "窝窝团",
  :docfind => "//deals/deal",
  :suite  => "p.price = n['price'];p.type_id = \"团购价\";p.finish_at = Time.at(n['end_date'].to_i);p.address = n['division_name'];p.title=n['title'];o = p.outlinks.new;o.url = n['deal_url'];p.uploads.new(:image_file_name => n['large_image_url']);",
  :tuan_urls=> [TuanUrl.new( {      :name => "窝窝团柳州", :url => "http://www.55tuan.com/openAPI.do?city=liuzhou", :enable => true})]
},
  {
  :name => "hao123",
  :docfind => "//urlset/url",
  :suite  => "d = d.children[1].first;d.each{|a| n[a.name] = a.content};p.price = n['price'];p.type_id = \"团购价\";p.finish_at = Time.at(n['endTime'].to_i);p.address = n['city'];p.title=n['title'];o = p.outlinks.new;o.url = n['loc'];p.uploads.new(:image_file_name => n['image']);",
  :tuan_urls=> [
    TuanUrl.new( {      :name => "24卷柳州", :url => "http://static.24quan.com/cms/liuzhou_bus.php", :enable => true}),
    TuanUrl.new( {      :name => "拉手团柳州", :url => "http://open.client.lashou.com/api/detail/city/427", :enable => true}),
    TuanUrl.new( {      :name => "信团柳州", :url => "http://www.cn403.com/api/hao123.php", :enable => true}),
    TuanUrl.new( {      :name => "糯米团柳州", :url => "http://www.nuomi.com/api/dailydeal?version=v1&city=liuzhou", :enable => true}),
    TuanUrl.new( {      :name => "美团柳州", :url => "http://www.meituan.com/api/v1/liuzhou/deals", :enable => true}),
    TuanUrl.new( {      :name => "米奇", :url => "http://www.miqi.cn/xml/apis/lab.api.hao123.xml", :enable => true}),
    TuanUrl.new( {      :name => "聚美优品", :url => "http://www.jumei.com/api/dealsv3.php", :enable => true}),
    TuanUrl.new( {      :name => "爱帮团", :url => "http://tuan.aibang.com/api/digest", :enable => true}),
#    TuanUrl.new( {      :name => "高朋", :url => "http://tuan1212.com/gaopeng.php", :enable => true}),
#    TuanUrl.new( {      :name => "趣团", :url => "http://www.quwan.com/tuan/api/hao123.php", :enable => true}),
    TuanUrl.new( {      :name => "团宝柳州", :url => "http://p5.groupon.cn/xml/city/cityproduct/?cityid=236", :enable => true}),
    TuanUrl.new( {      :name => "F团柳州", :url => "http://newapi.ftuan.com/api/v2.aspx?city=liuzhou", :enable => true}),
  ]
  },
]
