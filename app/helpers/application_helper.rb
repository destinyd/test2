module ApplicationHelper
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

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
  end

  def base_target_blank
    content_for :head ,raw('<base target="_blank">')
  end
end
