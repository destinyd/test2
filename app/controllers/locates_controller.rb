class LocatesController < ApplicationController
  layout 'home'
  def index
  end

  # 类似搜索
  def show  
    @name = params[:id]
    @value = @name

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
