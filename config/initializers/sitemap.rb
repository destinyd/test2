DynamicSitemaps::Sitemap.draw do
  
  # default per_page is 50.000 which is the specified maximum.
  per_page 10

  url root_url, :last_mod => DateTime.now, :change_freq => 'daily', :priority => 1
  new_page!

  url costs_prices_url, :last_mod => DateTime.now, :change_freq => 'daily', :priority => 0.8
  url cheapest_prices_url, :last_mod => DateTime.now, :change_freq => 'daily', :priority => 0.8
  url groupbuy_prices_url, :last_mod => DateTime.now, :change_freq => 'daily', :priority => 0.8
  url just_started_prices_url, :last_mod => DateTime.now, :change_freq => 'daily', :priority => 0.8
  url nearly_finish_prices_url, :last_mod => DateTime.now, :change_freq => 'daily', :priority => 0.8

  new_page!
  
  #Price.all.each do |price|
    #url price_url(price), :last_mod => price.updated_at, :change_freq => 'monthly', :priority => 0.7
  #end
  #new_page!
  
  autogenerate  :prices,# :goods,
                :last_mod => :updated_at,
                :change_freq => 'monthly',
                :priority => 0.5
  #new_page!
  
end
