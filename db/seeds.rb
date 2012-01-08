# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
TuanApi.destroy_all
TuanUrl.destroy_all
TuanApi.create [
  {
  :name => "窝窝团",
  :docfind => "//deals/deal",
  :suite  => "p[:price]=n['price'];p[:type_id]=21;p[:finish_at]=Time.at(n['end_date'].to_i);p[:started_at]=Time.at(n['start_date'].to_i);p[:address]=n['division_name'];p[:title]=n['title'];p[:title].gsub!(/<!\\[CDATA\\[(.*)\\]\\]>/,'\\1');o=p[:outlinks_attributes]=[{:url =>n['deal_url']}];p[:uploads_attributes]=[{:image_file_name => n['large_image_url']}];",
  :tuan_urls=> [TuanUrl.new( {      :name => "窝窝团柳州", :url => "http://www.55tuan.com/openAPI.do?city=liuzhou", :enable => true})]
},
  {
  :name => "hao1235",
  :docfind => "//urlset/url",
:suite=>"d=d.children[5].children[1];d.each{|a|n[a.name]=a.content};p[:price]=n['price'];p[:type_id]=21;p[:finish_at]=Time.at(n['endTime'].to_i);p[:started_at]=Time.at(n['startTime'].to_i);p[:address]=n['city'];p[:title]=n['title'];p[:title].gsub!(/<!\\[CDATA\\[(.*)\\]\\]>/,'\\1');o=p[:outlinks_attributes]=[{:url=>n['loc']}];p[:uploads_attributes]=[{:image_file_name=>n['image']}];",
  :tuan_urls=> [
    TuanUrl.new( {      :name => "拉手团柳州", :url => "http://open.client.lashou.com/api/detail/city/427", :enable => true}),
  ]
  },

  {
  :name => "hao1231",
  :docfind => "//urlset/url",
:suite=>"d=d.children[1].children[0];d.each{|a|n[a.name]=a.content};p[:price]=n['price'];p[:type_id]=21;p[:finish_at]=Time.at(n['endTime'].to_i);p[:started_at]=Time.at(n['startTime'].to_i);p[:address]=n['city'];p[:title]=n['title'];p[:title].gsub!(/<!\\[CDATA\\[(.*)\\]\\]>/,'\\1');o=p[:outlinks_attributes]=[{:url=>n['loc']}];p[:uploads_attributes]=[{:image_file_name=>n['image']}];",
  :tuan_urls=> [
    TuanUrl.new( {      :name => "24卷柳州", :url => "http://static.24quan.com/cms/liuzhou_bus.php", :enable => true}),
    TuanUrl.new( {      :name => "糯米团柳州", :url => "http://www.nuomi.com/api/dailydeal?version=v1&city=liuzhou", :enable => true}),
    TuanUrl.new( {      :name => "F团柳州", :url => "http://newapi.ftuan.com/api/v2.aspx?city=liuzhou", :enable => true}),
    #TuanUrl.new( {      :name => "趣团", :url => "http://www.quwan.com/tuan/api/hao123.php", :enable => true}), 2 0
  ]
  },
  {
  :name => "hao1233",
  :docfind => "//urlset/url",
:suite=>"d=d.children[3].children[1];d.each{|a|n[a.name]=a.content};p[:price]=n['price'];p[:type_id]=21;p[:finish_at]=Time.at(n['endTime'].to_i);p[:started_at]=Time.at(n['startTime'].to_i);p[:address]=n['city'];p[:title]=n['title'];p[:title].gsub!(/<!\\[CDATA\\[(.*)\\]\\]>/,'\\1');o=p[:outlinks_attributes]=[{:url=>n['loc']}];p[:uploads_attributes]=[{:image_file_name=>n['image']}];",
  :tuan_urls=> [
    TuanUrl.new( {      :name => "信团柳州", :url => "http://www.cn403.com/api/hao123.php", :enable => true}),
    #TuanUrl.new( {      :name => "美团柳州", :url => "http://www.meituan.com/api/v1/liuzhou/deals", :enable => true}),
    TuanUrl.new( {      :name => "米奇", :url => "http://www.miqi.cn/xml/apis/lab.api.hao123.xml", :enable => true}),
    TuanUrl.new( {      :name => "聚美优品", :url => "http://www.jumei.com/api/dealsv3.php", :enable => true}),
    TuanUrl.new( {      :name => "爱帮团", :url => "http://tuan.aibang.com/api/digest", :enable => true}),
    #TuanUrl.new( {      :name => "高朋", :url => "http://tuan1212.com/gaopeng.php", :enable => true}),
    TuanUrl.new( {      :name => "团宝柳州", :url => "http://p5.groupon.cn/xml/city/cityproduct/?cityid=236", :enable => true}),
  ]
  },

]

Article.create(
  [{
  :title=> '《神马价》网站测试版上线啦',
  :content => "《神马价》网站是一个可以让您记录自己消费情况的网站，可以让您把自己的每一比消费状况的都记录下来，让您的钱花得明明白白。同时《神马价》网站也可以查询到您所需要的商品的价格，使您无需掌握某个市场，也能了解其价格的走向，让您花钱花的开心、实在。",
  :is_valid => true
},
  {
  :title=> '双倍经验活动',
  :content => "《神马价》网站在测试阶段，获取的经验是正式版的两倍，且无获取经验上线，赶快晒价、晒物，升级吧。",
  :is_valid => true

},
  {
  :title=> '积分的作用',
  :content => "积分为《神马价》网站的一种代币，不具有交易作用，但是可以用来兑换商家提供的各种优惠卷、甚至是实物奖品。积分获取方式与经验相同，但是只有验证通过的经验才能转化为积分，当然如果是发布一些虚假的或者是非法的信息，也可能会被扣除获取经验的数倍的积分哦。",
  :is_valid => true

}
]
)
