function get_attrs(id){
  $.getJSON('/goods/'+id+'/attrs', function(data) {
    var items = [];
    $.each(data, function(key, val) {
        items.push('<li id="attr_' + key + '">' + key +':' + val + '</li>');
    });
    $('#attrs').html(items.join(''));
    $('#a_attrs').attr('onclick','');
    $('#a_attrs').click(function(){
      show_and_hide('.product_attrs','.goods_div')
    });
  });
}
function new_attr(){
  var a;
}
