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
