function show_and_hide(show,hide){
  $(show).show();
  $(hide).hide();
  return false;
}
function ajaxForm(formdom,action){
      if(action == "get")
        formdom.submit(function () {  
          $.get(this.action, $(this).serialize(), null, 'script');  
          return false;  
        });    
      else      
        formdom.submit(function () {  
          $.post(this.action, $(this).serialize(), null, 'script');  
          return false;  
        });    

}    
    $(function () {  

      $('#goods th a, .pagination a').live('click',  
        function () {  
          $.getScript(this.href);  
          return false;  
        }  
      );        
      // Search form.  
      $('#goods_search').submit(function () {  
        $.get(this.action, $(this).serialize(), null, 'script');  
        return false;  
      });
      
      ajaxForm($('#new_comment'));

    })
        
