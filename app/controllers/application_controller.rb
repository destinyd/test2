class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_cache_id
  helper_method :city_info_of_ip,:get_city_name

  #def sort_direction  
    #%w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"  
  #end  

  #def sort_column  
    #Good.column_names.include?(params[:sort]) ? params[:sort] : "name"  
  #end          

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

  def city_info_of_ip
    return @ip_infos if @ip_infos
    unless cookies[:got_ip]
      cookies[:got_ip] = true
      ip = request.ip
      @ip = Ip.where(:ip => ip).first_or_create
      get_city_name @ip.city
    end
    ip_infos
  end


  private
  def get_cache_id
    @cache_id = Time.now.strftime "%Y%m_%d%H"
  end
  def ip_infos
    @ip_infos = {
      :city => cookies[:city],
      :lat => cookies[:lat],
      :lon => cookies[:lon]
    }
  end


end
