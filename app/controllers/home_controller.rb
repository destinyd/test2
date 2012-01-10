class HomeController < ApplicationController
  def index
    @articles = @recent_articles
#    @categories = Category.roots
    @flashes = Flash.recent# if @flashes.blank?
    @cheapest =     Price.cheapest.limit 10
    @recent_prices =     Price.recent.group(:title).limit 10
    @recent_groupbuy =     Price.groupbuy.group(:title).limit 10
    @recent_local =     Price.local.limit 10
    @recent_goods = Good.recent.group(:name).limit 10
    @recent_users    = User.recent
    @exps  = Integral.recent
    @uploads  = Upload.recent.includes(:uploadable).limit 6
    @focus  = Focus.most
    @good_tags = Good.tag_counts.order('count desc').limit(10)
  end

end
