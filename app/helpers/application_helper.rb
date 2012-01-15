module ApplicationHelper
  def initialize(a,b,c)
    super(a,b,c)
    session[:loc] = request.location unless session[:loc]
    @loc = session[:loc]
    session[:geo_result] = Geocoder.search(@loc.city).first if session[:geo_result].nil? and @loc
    @geo_result = session[:geo_result]
  end

  def sortable(column, title = nil)  
    title ||= column.titleize  
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil  
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"  
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}  
  end

  def action_show(class_constantize  = nil,diy_action = nil)
    class_constantize ||=  controller_name.singularize.capitalize.constantize
    diy_action ||= action_name
    t('titles.'+diy_action,:model => class_constantize.model_name.human)
    #    output  +=  model.model_name.human
    #    elsif action_name == 'new'
  end

  def could_bread?
    !['home','sessions','registrations'].include? controller_name
  end
end
