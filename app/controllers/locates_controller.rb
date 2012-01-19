class LocatesController < ApplicationController
  layout 'home'
  def index
  end

  # 类似搜索
  def show  
    @name = params[:id]
    @cheapest = Price.cheapest.near(@name,10).limit 10
    @recent_prices =     Price.near(@name,10).recent.limit 10
    @recent_groupbuy =     Price.near(@name,10).groupbuy.limit 10
    @recent_cost =     Price.near(@name,10).costs.limit 10

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

  private
  def get_city_name geo
    if geo.nil?
      city = City.find_by_name(params[:id])
      if city
        cookies[:lat] = city.lat
        cookies[:lon] = city.lon
        cookies[:city] = city.name
      end
    else
      if geo
        cookies[:lat] = geo.latitude
        cookies[:lon] = geo.longitude
        cookies[:city] = geo.city 
      end
    end
  end

end
