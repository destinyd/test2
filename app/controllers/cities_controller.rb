class CitiesController < ApplicationController
  layout 'home'
  def index
    @provinces = Province.scoped.includes(:cities)
  end

  def show
    @name = params[:id]
    @cheapest = Price.cheapest.near(@name,20).limit 10
    @recent_prices =     Price.recent.near(@name,20).limit 10
    @recent_groupbuy =     Price.groupbuy.near(@name,20).limit 10
    @recent_cost =     Price.costs.near(@name,20).limit 10
    #@recent_nearest =     Price.near(@name,20).nearest.limit 10
    #@recent_goods = Good.recent.group(:name).limit 10
  end

end
