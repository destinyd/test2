// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery.purr
//= require best_in_place
//= require_tree .
function show_and_hide(show,hide){
  $(hide).hide();
  $(show).show();
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
function send_review(){
  $('#new_review').submit();
  $('#review_status').attr('enable',false);
}
$(function(){
  ajaxForm($('#new_comment'));
})
function good_bound(){
  var obj = $('#price_good_good_id');
  var obj_good_name = $('#price_good_good_name');
  console.log(obj_good_name);
  if(obj.val())
  {
    //obj_good_name.remove();
    obj_good_name.attr('disabled',true);
    $('#new_price_good_btn').attr('disabled',true);
    $('#new_price_good_ff').remove();
    $('#new_price_good').submit();
  }
  else{
    $('#new_price_good_btn').hide();
    console.log(obj_good_name.val());
    $('#price_good_name').val(obj_good_name.val());
    obj_good_name.remove();
    $('#price_good_good_id').remove();
    $('#new_price_good_ff').show();
    $('#new_price_good_f').hide();
    //$('#price_good_good_submit').attr('disabled',true)
  }
  return false;
}

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
