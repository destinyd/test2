class ApplicationController < ActionController::Base
  protect_from_forgery
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

  def after_sign_in_path_for(resource)
    return new_user_info_path unless resource.user_info
    stored_location_for(resource) || root_path 
  end
end
