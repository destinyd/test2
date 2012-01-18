module ApplicationHelper
  def initialize(a,b,c)
    super(a,b,c)
    unless cookies[:lat] and cookies[:lon]
      unless cookies[:city]
        @geo = request.location
        @geo = Geocoder.search(@geo.city).first
        cookies.merge :lat => @geo.latitude,:lon => @geo.longitude,:city => @geo.city if @geo
      end
    end 
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
