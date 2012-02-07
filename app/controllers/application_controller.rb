class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_cache_id
  def sort_direction  
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"  
  end  

  def sort_column  
    Good.column_names.include?(params[:sort]) ? params[:sort] : "name"  
  end          

  def find_able
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return @able = $1.classify.constantize.find(value)  
      end  
    end  
    nil  
  end

  def get_city_name geo
    if geo
      cookies[:lat] = geo.lat
      cookies[:lon] = geo.lon
      cookies[:city] = geo.name
    end
  end


  private
  def get_cache_id
    @cache_id = Time.now.strftime "%Y%m/%d-%H/"
  end
end
