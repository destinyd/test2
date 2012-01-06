class HomeController < ApplicationController
  def index
    @articles = @recent_articles
#    @categories = Category.roots
    @flashes = Flash.recent# if @flashes.blank?
    @cheapest =     Price.cheapest
    @recent_prices =     Price.recent
    @recent_goods = Good.recent
    @recent_users    = User.recent
    @exps  = Integral.recent
#    @uploads  = Upload.recent
    @focus  = Focus.most
    @good_tags = Good.tag_counts.order('count desc').limit(10)
  end

end
