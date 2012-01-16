class LocatesController < ApplicationController
  layout 'home'
  def index
  end

  def show 
  end

  def create
    geo_result = Geocoder.search(params[:id]).first
    session[:geo_result]  = geo_result if geo_result
    redirect_to locate_path(params[:id])
  end

end
