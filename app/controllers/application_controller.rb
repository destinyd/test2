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
end
