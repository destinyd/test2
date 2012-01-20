class CitiesController < ApplicationController
  layout 'home'
  def index
  end

  def show
    @name = params[:id]
    @city = City.find_by_name @name 
    return redirect_to locate_path(params[:id]) unless @city
    @value = @city.lat,@city.lon
    #@cheapest = Price.cheapest.near(@value,20).limit(10)
    #@recent_prices =     Price.recent.near(@value,20).limit(10)
    #@recent_groupbuy =     Price.groupbuy.near(@value,20).limit(10)
    #@recent_cost =     Price.costs.near(@value,20).limit(10)
    #@recent_nearest =     Price.near(@value,20).nearest.limit(10)
    #@recent_goods = Good.recent.group(:name).limit(10)
  end

end
