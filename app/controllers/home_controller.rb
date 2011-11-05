class HomeController < ApplicationController
  def index
#    @categories = Category.roots
    @articles = Article.recent
    @flashes = Flash.recent# if @flashes.blank?
    @cheapest =     Price.cheapest
    @recent_goods = Good.recent
    @recent_users    = User.recent
    @integrals  = Integral.recent
    @uploads  = Upload.recent
    @focus  = Focus.most
    @good_tags = Good.tag_counts
  end

end
