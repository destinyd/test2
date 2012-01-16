class CitiesController < ApplicationController
  layout 'home'
  def index
    @provinces = Province.scoped.includes(:cities)
  end

  def show
    @name = params[:id]
    @cheapest = Price.cheapest.near(@name,20).limit 10
    @recent_prices =     Price.near(@name,20).recent.limit 10
    @recent_groupbuy =     Price.near(@name,20).groupbuy.limit 10
    @recent_cost =     Price.near(@name,20).costs.limit 10
    #@recent_nearest =     Price.near(@name,20).nearest.limit 10
    #@recent_goods = Good.recent.group(:name).limit 10
  end

end
