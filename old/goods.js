function get_attrs(id){
  $.getJSON('/goods/'+id+'/attrs', function(data) {
    var items = [];
    $.each(data, function(key, val) {
        items.push('<li id="attr_' + key + '" title="查看更多'+key+'信息"><a href="/goods/' + id + '/attrs/' + key +'" data-remote="true">' + key +'</a>:' + val + '</li>');
    });
    $('#attrs').html(items.join(''));
    $('#a_attrs').attr('onclick','');
    $('#a_attrs').click(function(){
      show_and_hide('.product_attrs','.goods_div')
    });
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
})

