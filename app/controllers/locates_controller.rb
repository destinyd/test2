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
    geo_result = Geocoder.search(params[:id]).first
    session[:geo_result]  = geo_result if geo_result
    redirect_to :back
  rescue ActionController::RedirectBackError
    redirect_to root_path
  end

end
