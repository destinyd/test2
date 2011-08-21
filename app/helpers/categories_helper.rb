module CategoriesHelper
  def traversal(categories)
    content = ""
    categories.each do |category|
      content += get_content(category)
      content += '<div style="width:200px;  margin-left:50px;">'                
      content += traversal(category.children)
      content += '</div>'      
    end
      content += '<div style="clear:both"></div>' if categories.all?{|c| c.children.count ==0}
      content.html_safe
  end
  
  def get_content(category)
    content = "<div style='width:100px; '>#{link_to category.name,category_goods_path(category)} </div>"
  end
end
