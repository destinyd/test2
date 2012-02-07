# coding: utf-8
TuanUrl.all.each{|tuan_url| tuan_url.update_attribute :enable ,0}

TuanApi.find_or_create_by_name("hao1233").update_attributes(
  :name => "hao123",
  :docfind => "//urlset/url",
  :suite=>"p=self.get_one(d,{:title=>'data/display/title',:price=>'data/display/price',:started_at => 'data/display/startTime',:finish_at => 'data/display/endTime',:address=>'data/display/city'});p[:uploads_attributes]=[self.get_one(d,{:image_file_name=>'data/display/image'})];p[:outlinks_attributes]=[self.get_one(d,{:url=>'loc'})];",
)
TuanUrl.find_or_create_by_name("信团柳州").update_attributes(:name=>"信团柳州" , :url => "http://www.cn403.com/api/hao123.php", :enable => true,:tuan_api_name => 'hao123')
TuanUrl.find_or_create_by_name("米奇").update_attributes(:name=>"米奇" , :url => "http://www.miqi.cn/xml/apis/lab.api.hao123.xml", :enable => true,:tuan_api_name => 'hao123')
TuanUrl.find_or_create_by_name("聚美优品").update_attributes(:name=>"聚美优品" , :url => "http://www.jumei.com/api/dealsv3.php", :enable => true,:tuan_api_name => 'hao123')
TuanUrl.find_or_create_by_name("爱帮团").update_attributes(:name=>"爱帮团" , :url => "http://tuan.aibang.com/api/digest", :enable => true,:tuan_api_name => 'hao123')
TuanUrl.find_or_create_by_name("F团柳州").update_attributes(:name=>"F团柳州" , #:url => "http://newapi.ftuan.com/api/v2.aspx?city=liuzhou", 
                                                            :url=>"http://newapi.ftuan.com/api/v2.aspx", #所有
                                                            :enable => true,:tuan_api_name => 'hao123')

TuanApi.find_or_create_by_name("窝窝团").update_attributes(
  :name => "窝窝团",
  :docfind => "//deals/deal",
  :suite=>"p=self.get_one(d,{:title=>'title',:price=>'price',:started_at => 'start_date',:finish_at => 'end_date',:address=>'division_name'});p[:uploads_attributes]=[self.get_one(d,{:image_file_name=>'large_image_url'})];p[:outlinks_attributes]=[self.get_one(d,{:url=>'deal_url'})];",
)
TuanUrl.find_or_create_by_name("窝窝团柳州").update_attributes(:name=>"窝窝团柳州" , :url => "http://www.55tuan.com/openAPI.do?city=liuzhou", :enable => true,:tuan_api_name => '窝窝团')

TuanApi.find_or_create_by_name("google").update_attributes(
  :name => "google",
  :docfind => "//offer",
  :suite=>"p=self.get_one(d,{:title=>'title',:price=>'current_price',:started_at => 'start_timestamp',:finish_at => 'end_timestamp',:desc => 'description',:address=>'shops/shop_info/shop_address',:longitude=>'shops/shop_info/longitude',:latitude=>'shops/shop_info/latitude'});p[:uploads_attributes]=[self.get_one(d,{:image_file_name=>'image_url'})];p[:outlinks_attributes]=[self.get_one(d,{:url=>'url'})];",
)
TuanUrl.find_or_create_by_name("拉手google").update_attributes(:name=>"拉手google" , :url => "http://open.client.lashou.com/google", :enable => true,:tuan_api_name => 'google')
TuanUrl.find_or_create_by_name("58团google").update_attributes(:name=>"58团google" , :url => "http://open.t.58.com/api/google", :enable => true,:tuan_api_name => 'google')
TuanUrl.find_or_create_by_name("团宝google").update_attributes(:name=>"团宝google" , :url => "http://p5.groupon.cn/xml/city/cityproduct/google", :enable => true,:tuan_api_name => 'google')
TuanUrl.find_or_create_by_name("糯米团google").update_attributes(:name=>"糯米团google" , :url => "http://www.nuomi.com/api/google", :enable => true,:tuan_api_name => 'google')
TuanUrl.find_or_create_by_name("24卷google").update_attributes(:name=>"24卷google" , :url => "http://static.24quan.com/cms/google.php", :enable => true,:tuan_api_name => 'google')

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

City.all.each do |city|
  Locate.create! :name => city.name,:lat => city.lat,:lon => city.lon
end

#geocode
#Price.where("latitude is null and address <> '全国'").group(:address).each do |b|
  #b.geocode
  #Price.connection.execute "update prices set longitude='#{b.longitude}' , latitude = '#{b.latitude}' where latitude is null and address ='#{b.address}'" unless b.latitude.nil?
#end
#to all
#b = Price.where("latitude is null and address = '全国'").first ; 
#if b
#b.address = '中国'; b.geocode;  Price.connection.execute "update prices set longitude='#{b.longitude}' , latitude = '#{b.latitude}',address='中国',type_id = 22 where latitude is null and address ='全国'"
#end
