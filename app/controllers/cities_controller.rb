class CitiesController < ApplicationController
  layout 'home'
  def index
    @provinces = Province.scoped.includes(:cities)
  end

  def show
    @city = City.find_by_name params[:id]
    return redirect_to locate_path(params[:id]) unless @city
    @name = @city.name
    @cheapest = Price.cheapest.near([@city.lat,@city.lon],20).limit 10
    @recent_prices =     Price.recent.near([@city.lat,@city.lon],20).limit 10
    @recent_groupbuy =     Price.groupbuy.near([@city.lat,@city.lon],20).limit 10
    @recent_cost =     Price.costs.near([@city.lat,@city.lon],20).limit 10
    #@recent_nearest =     Price.near([@city.lat,@city.lon],20).nearest.limit 10
    #@recent_goods = Good.recent.group(:name).limit 10
  end

end
