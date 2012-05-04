# coding: utf-8
# TuanUrl.all.each{|tuan_url| tuan_url.update_attribute :enable ,0}

# TuanApi.find_or_create_by_name("hao123").update_attributes(
#   :name => "hao123",
#   :docfind => "//urlset/url",
#   :suite=>"p=self.get_one(d,{:title=>'data/display/title',:price=>'data/display/price',:original_price=>'data/display/value',:desc => 'data/display/description',:started_at => 'data/display/startTime',:finish_at => 'data/display/endTime',:address=>'data/display/address',:city=>'data/display/city'});p[:img]=get_in_dom(d,'data/display/image');p[:outlinks_attributes]=[self.get_one(d,{:url=>'loc'})];",
# )
# TuanUrl.find_or_create_by_name("信团柳州").update_attributes(:name=>"信团柳州" , :url => "http://www.cn403.com/api/hao123.php", :enable => true,:tuan_api_name => 'hao123')
# TuanUrl.find_or_create_by_name("米奇").update_attributes(:name=>"米奇" , :url => "http://www.miqi.cn/xml/apis/lab.api.hao123.xml", :enable => true,:tuan_api_name => 'hao123')
# TuanUrl.find_or_create_by_name("聚美优品").update_attributes(:name=>"聚美优品" , :url => "http://www.jumei.com/api/dealsv3.php", :enable => true,:tuan_api_name => 'hao123')
# TuanUrl.find_or_create_by_name("爱帮团").update_attributes(:name=>"爱帮团" , :url => "http://tuan.aibang.com/api/digest", :enable => true,:tuan_api_name => 'hao123')
# TuanUrl.find_or_create_by_name("F团柳州").update_attributes(:name=>"F团柳州" , #:url => "http://newapi.ftuan.com/api/v2.aspx?city=liuzhou", 
#                                                             :url=>"http://newapi.ftuan.com/api/v2.aspx", #所有
#                                                             :enable => true,:tuan_api_name => 'hao123')
# TuanUrl.find_or_create_by_name("满座").update_attributes(:name=>"满座" , :url => "http://api.manzuo.com/common.xml", :enable => true,:tuan_api_name => 'hao123')

# TuanApi.find_or_create_by_name("窝窝团").update_attributes(
#   :name => "窝窝团",
#   :docfind => "//deals/deal",
#   :suite=>"p=self.get_one(d,{:title=>'title',:price=>'price',:started_at => 'start_date',:finish_at => 'end_date',:address=>'division_name'});p[:img]=get_in_dom(d,'large_image_url');p[:outlinks_attributes]=[self.get_one(d,{:url=>'deal_url'})];",
# )
# #TuanUrl.find_or_create_by_name("窝窝团柳州").update_attributes(:name=>"窝窝团柳州" , :url => "http://www.55tuan.com/openAPI.do?city=liuzhou", :enable => false,:tuan_api_name => '窝窝团')

# TuanApi.find_or_create_by_name("google").update_attributes(
#   :name => "google",
#   :docfind => "//offer",
#   :suite=>"p=self.get_one(d,{:title=>'title',:price=>'current_price',:original_price=>'original_price',:started_at => 'start_timestamp',:finish_at => 'end_timestamp',:desc => 'description',:address=>'shops/shop_info/shop_address',:city => 'publish_cities/city',:longitude=>'shops/shop_info/longitude',:latitude=>'shops/shop_info/latitude'});p[:img]=get_in_dom(d,'image_url');p[:outlinks_attributes]=[self.get_one(d,{:url=>'url'})];",
# )
# TuanUrl.find_or_create_by_name("拉手google").update_attributes(:name=>"拉手google" , :url => "http://open.client.lashou.com/google", :enable => true,:tuan_api_name => 'google')
# TuanUrl.find_or_create_by_name("58团google").update_attributes(:name=>"58团google" , :url => "http://open.t.58.com/api/google", :enable => true,:tuan_api_name => 'google')
# #TuanUrl.find_or_create_by_name("团宝google").update_attributes(:name=>"团宝google" , :url => "http://p5.groupon.cn/xml/city/cityproduct/google", :enable => true,:tuan_api_name => 'google')
# TuanUrl.find_or_create_by_name("糯米团google").update_attributes(:name=>"糯米团google" , :url => "http://www.nuomi.com/api/google", :enable => true,:tuan_api_name => 'google')
# #TuanUrl.find_or_create_by_name("24卷google").update_attributes(:name=>"24卷google" , :url => "http://static.24quan.com/cms/google.php", :enable => true,:tuan_api_name => 'google')

# TuanApi.find_or_create_by_name("美团").update_attributes(
#   :name => "美团",
#   :docfind => "//deals/data",
#   :suite=>"p=self.get_one(d,{:title=>'deal/deal_title',:price=>'deal/price',:original_price => 'deal/value',:started_at => 'deal/start_time',:finish_at => 'deal/end_time',:desc => 'deal/deal_desc',:address => 'shops/shop/shop_addr',:city => 'deal/city_name',:latitude => 'shops/shop/shop_lat',:longitude => 'shops/shop/shop_long'});p[:img]=get_in_dom(d,'deal/deal_img');p[:outlinks_attributes]=[self.get_one(d,{:url=>'deal/deal_url'})];p[:desc]+='<br />'+d.find('deal/deal_wow').first.content.strip if d.find('deal/deal_wow').first;p[:desc]+='<br />'+d.find('deal/deal_tips').first.content.strip if d.find('deal/deal_tips').first;p[:desc]+='<br />'+d.find('shops/shop/shop_trafficinfo').first.content.strip if d.find('shops/shop/shop_trafficinfo').first;p[:city] = '全国' if p[:city].length > 50;",
# )

# TuanUrl.find_or_create_by_name("美团北京").update_attributes(:name=>"美团北京",:url => "http://www.meituan.com/api/v2/beijing/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团上海").update_attributes(:name=>"美团上海",:url => "http://www.meituan.com/api/v2/shanghai/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团广州").update_attributes(:name=>"美团广州",:url => "http://www.meituan.com/api/v2/guangzhou/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团深圳").update_attributes(:name=>"美团深圳",:url => "http://www.meituan.com/api/v2/shenzhen/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团天津").update_attributes(:name=>"美团天津",:url => "http://www.meituan.com/api/v2/tianjin/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团西安").update_attributes(:name=>"美团西安",:url => "http://www.meituan.com/api/v2/xian/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团福州").update_attributes(:name=>"美团福州",:url => "http://www.meituan.com/api/v2/fuzhou/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团重庆").update_attributes(:name=>"美团重庆",:url => "http://www.meituan.com/api/v2/chongqing/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团杭州").update_attributes(:name=>"美团杭州",:url => "http://www.meituan.com/api/v2/hangzhou/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团宁波").update_attributes(:name=>"美团宁波",:url => "http://www.meituan.com/api/v2/ningbo/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团无锡").update_attributes(:name=>"美团无锡",:url => "http://www.meituan.com/api/v2/wuxi/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团南京").update_attributes(:name=>"美团南京",:url => "http://www.meituan.com/api/v2/nanjing/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团合肥").update_attributes(:name=>"美团合肥",:url => "http://www.meituan.com/api/v2/hefei/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团武汉").update_attributes(:name=>"美团武汉",:url => "http://www.meituan.com/api/v2/wuhan/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团成都").update_attributes(:name=>"美团成都",:url => "http://www.meituan.com/api/v2/chengdu/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团青岛").update_attributes(:name=>"美团青岛",:url => "http://www.meituan.com/api/v2/qingdao/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团厦门").update_attributes(:name=>"美团厦门",:url => "http://www.meituan.com/api/v2/xiamen/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团大连").update_attributes(:name=>"美团大连",:url => "http://www.meituan.com/api/v2/dalian/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团沈阳").update_attributes(:name=>"美团沈阳",:url => "http://www.meituan.com/api/v2/shenyang/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团长沙").update_attributes(:name=>"美团长沙",:url => "http://www.meituan.com/api/v2/changsha/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团郑州").update_attributes(:name=>"美团郑州",:url => "http://www.meituan.com/api/v2/zhengzhou/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团石家庄").update_attributes(:name=>"美团石家庄",:url => "http://www.meituan.com/api/v2/shijiazhuang/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团苏州").update_attributes(:name=>"美团苏州",:url => "http://www.meituan.com/api/v2/suzhou/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团淄博").update_attributes(:name=>"美团淄博",:url => "http://www.meituan.com/api/v2/zibo/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团南通").update_attributes(:name=>"美团南通",:url => "http://www.meituan.com/api/v2/nantong/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团南昌").update_attributes(:name=>"美团南昌",:url => "http://www.meituan.com/api/v2/nanchang/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团保定").update_attributes(:name=>"美团保定",:url => "http://www.meituan.com/api/v2/baoding/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团常州").update_attributes(:name=>"美团常州",:url => "http://www.meituan.com/api/v2/changzhou/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团东莞").update_attributes(:name=>"美团东莞",:url => "http://www.meituan.com/api/v2/dongguan/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团佛山").update_attributes(:name=>"美团佛山",:url => "http://www.meituan.com/api/v2/foshan/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团桂林").update_attributes(:name=>"美团桂林",:url => "http://www.meituan.com/api/v2/guilin/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团海口").update_attributes(:name=>"美团海口",:url => "http://www.meituan.com/api/v2/haikou/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团济南").update_attributes(:name=>"美团济南",:url => "http://www.meituan.com/api/v2/jinan/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团焦作").update_attributes(:name=>"美团焦作",:url => "http://www.meituan.com/api/v2/jiaozuo/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团锦州").update_attributes(:name=>"美团锦州",:url => "http://www.meituan.com/api/v2/jinzhou/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团南宁").update_attributes(:name=>"美团南宁",:url => "http://www.meituan.com/api/v2/nanning/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团太原").update_attributes(:name=>"美团太原",:url => "http://www.meituan.com/api/v2/taiyuan/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团芜湖").update_attributes(:name=>"美团芜湖",:url => "http://www.meituan.com/api/v2/wuhu/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团烟台").update_attributes(:name=>"美团烟台",:url => "http://www.meituan.com/api/v2/yantai/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团哈尔滨").update_attributes(:name=>"美团哈尔滨",:url => "http://www.meituan.com/api/v2/haerbin/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团廊坊").update_attributes(:name=>"美团廊坊",:url => "http://www.meituan.com/api/v2/langfang/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团贵阳").update_attributes(:name=>"美团贵阳",:url => "http://www.meituan.com/api/v2/guiyang/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团珠海").update_attributes(:name=>"美团珠海",:url => "http://www.meituan.com/api/v2/zhuhai/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团齐齐哈尔").update_attributes(:name=>"美团齐齐哈尔",:url => "http://www.meituan.com/api/v2/qiqihaer/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团泉州").update_attributes(:name=>"美团泉州",:url => "http://www.meituan.com/api/v2/quanzhou/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团温州").update_attributes(:name=>"美团温州",:url => "http://www.meituan.com/api/v2/wenzhou/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团中山").update_attributes(:name=>"美团中山",:url => "http://www.meituan.com/api/v2/zhongshan/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团昆明").update_attributes(:name=>"美团昆明",:url => "http://www.meituan.com/api/v2/kunming/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团长春").update_attributes(:name=>"美团长春",:url => "http://www.meituan.com/api/v2/changchun/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团徐州").update_attributes(:name=>"美团徐州",:url => "http://www.meituan.com/api/v2/xuzhou/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团扬州").update_attributes(:name=>"美团扬州",:url => "http://www.meituan.com/api/v2/yangzhou/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团唐山").update_attributes(:name=>"美团唐山",:url => "http://www.meituan.com/api/v2/tangshan/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团秦皇岛").update_attributes(:name=>"美团秦皇岛",:url => "http://www.meituan.com/api/v2/qinhuangdao/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团邯郸").update_attributes(:name=>"美团邯郸",:url => "http://www.meituan.com/api/v2/handan/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团运城").update_attributes(:name=>"美团运城",:url => "http://www.meituan.com/api/v2/yuncheng/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团临汾").update_attributes(:name=>"美团临汾",:url => "http://www.meituan.com/api/v2/linfen/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团呼和浩特").update_attributes(:name=>"美团呼和浩特",:url => "http://www.meituan.com/api/v2/huhehaote/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团包头").update_attributes(:name=>"美团包头",:url => "http://www.meituan.com/api/v2/baotou/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团鞍山").update_attributes(:name=>"美团鞍山",:url => "http://www.meituan.com/api/v2/anshan/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团抚顺").update_attributes(:name=>"美团抚顺",:url => "http://www.meituan.com/api/v2/fushun/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团吉林").update_attributes(:name=>"美团吉林",:url => "http://www.meituan.com/api/v2/jilin/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团连云港").update_attributes(:name=>"美团连云港",:url => "http://www.meituan.com/api/v2/lianyungang/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团盐城").update_attributes(:name=>"美团盐城",:url => "http://www.meituan.com/api/v2/yancheng/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团镇江").update_attributes(:name=>"美团镇江",:url => "http://www.meituan.com/api/v2/zhenjiang/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团泰州").update_attributes(:name=>"美团泰州",:url => "http://www.meituan.com/api/v2/taizhou/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团嘉兴").update_attributes(:name=>"美团嘉兴",:url => "http://www.meituan.com/api/v2/jiaxing/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团湖州").update_attributes(:name=>"美团湖州",:url => "http://www.meituan.com/api/v2/huzhou/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团绍兴").update_attributes(:name=>"美团绍兴",:url => "http://www.meituan.com/api/v2/shaoxing/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团金华").update_attributes(:name=>"美团金华",:url => "http://www.meituan.com/api/v2/jinhua/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团台州").update_attributes(:name=>"美团台州",:url => "http://www.meituan.com/api/v2/taizhoutz/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团东营").update_attributes(:name=>"美团东营",:url => "http://www.meituan.com/api/v2/dongying/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团潍坊").update_attributes(:name=>"美团潍坊",:url => "http://www.meituan.com/api/v2/weifang/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团济宁").update_attributes(:name=>"美团济宁",:url => "http://www.meituan.com/api/v2/jining/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团泰安").update_attributes(:name=>"美团泰安",:url => "http://www.meituan.com/api/v2/taian/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团威海").update_attributes(:name=>"美团威海",:url => "http://www.meituan.com/api/v2/weihai/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团日照").update_attributes(:name=>"美团日照",:url => "http://www.meituan.com/api/v2/rizhao/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团临沂").update_attributes(:name=>"美团临沂",:url => "http://www.meituan.com/api/v2/linyi/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团聊城").update_attributes(:name=>"美团聊城",:url => "http://www.meituan.com/api/v2/liaocheng/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团洛阳").update_attributes(:name=>"美团洛阳",:url => "http://www.meituan.com/api/v2/luoyang/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团宜昌").update_attributes(:name=>"美团宜昌",:url => "http://www.meituan.com/api/v2/yichang/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团襄阳").update_attributes(:name=>"美团襄阳",:url => "http://www.meituan.com/api/v2/xiangyang/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团荆州").update_attributes(:name=>"美团荆州",:url => "http://www.meituan.com/api/v2/jingzhou/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团衡阳").update_attributes(:name=>"美团衡阳",:url => "http://www.meituan.com/api/v2/hengyang/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团岳阳").update_attributes(:name=>"美团岳阳",:url => "http://www.meituan.com/api/v2/yueyang/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团江门").update_attributes(:name=>"美团江门",:url => "http://www.meituan.com/api/v2/jiangmen/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团惠州").update_attributes(:name=>"美团惠州",:url => "http://www.meituan.com/api/v2/huizhou/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团柳州").update_attributes(:name=>"美团柳州",:url => "http://www.meituan.com/api/v2/liuzhou/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团遵义").update_attributes(:name=>"美团遵义",:url => "http://www.meituan.com/api/v2/zunyi/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团兰州").update_attributes(:name=>"美团兰州",:url => "http://www.meituan.com/api/v2/lanzhou/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团西宁").update_attributes(:name=>"美团西宁",:url => "http://www.meituan.com/api/v2/xining/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团昆山").update_attributes(:name=>"美团昆山",:url => "http://www.meituan.com/api/v2/kunshan/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团义乌").update_attributes(:name=>"美团义乌",:url => "http://www.meituan.com/api/v2/yiwu/deals",:enable => true,:tuan_api_name => '美团')
# TuanUrl.find_or_create_by_name("美团顺德").update_attributes(:name=>"美团顺德",:url => "http://www.meituan.com/api/v2/shunde/deals",:enable => true,:tuan_api_name => '美团')

# TuanApi.find_or_create_by_name("360").update_attributes(
#   :name => "360",
#   :docfind => "//data/goodsdata/goods",
#   :suite=>"p=self.get_one(d,{:title=>'title',:price=>'sale_price',:started_at => 'start_time',:finish_at => 'close_time',:address=>'merchant_addr',:city=>'city_name',:original_price => 'original_price'});p[:img]=get_in_dom(d,'img_url');p[:outlinks_attributes]=[self.get_one(d,{:url=>'goods_url'})];p[:is_360]=true;p[:started_at]=DateTime.parse p[:started_at];p[:finish_at]=DateTime.parse p[:finish_at];",
# )
# TuanUrl.find_or_create_by_name("窝窝团360").update_attributes(:name=>"窝窝团360" , :url => "http://www.55tuan.com/360api", :enable => true,:tuan_api_name => '360')



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
