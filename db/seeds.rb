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
  :suite  => "p.price = n['price'];p.type_id = 21;p.finish_at = n['end_date'].to_i;p.address = n['division_name'];p.title=n['title'];o = p.outlinks.new;o.url = n['deal_url'];",
  :tuan_urls=> [TuanUrl.new( {      :name => "窝窝团柳州", :url => "http://www.55tuan.com/openAPI.do?city=liuzhou", :enable => true})]
},
  {
  :name => "hao123",
  :docfind => "//urlset/url",
  :suite  => "d = d.children[1].first;d.each{|a| n[a.name] = a.content};p.price = n['price'];p.type_id = 21;p.finish_at = n['endTime'].to_i;p.address = n['city'];p.title=n['title'];o = p.outlinks.new;o.url = n['loc'];",
  :tuan_urls=> [TuanUrl.new( {      :name => "F团柳州", :url => "http://newapi.ftuan.com/api/v2.aspx?city=liuzhou", :enable => true})]
},
]
