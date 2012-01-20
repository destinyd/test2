class LocatesController < ApplicationController
  layout 'home'
  def index
  end

  # 类似搜索
  def show  
    @name = params[:id]
    @value = @name
    #@cheapest = Price.cheapest.near(@value,10)).limit(10)
    #@recent_prices =     Price.near(@value,10)).recent.limit(10)
    #@recent_groupbuy =     Price.near(@value,10)).groupbuy.limit(10)
    #@recent_cost =     Price.near(@value,10)).costs.limit(10)

    render 'cities/show'
  end

  def new
  end

  def create
    @geo = Geocoder.search(params[:id]).first
    get_city_name @geo
    #cookies[:geo][:city] = Geocoder.search(@geo.city).first.city if @geo
    #cookies[:geo][:city] = params[:id] unless @geo
    redirect_to :back
  rescue ActionController::RedirectBackError
    redirect_to root_path
  end
end
