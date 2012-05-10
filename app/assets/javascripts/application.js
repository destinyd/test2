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
function send_review(selector){
  $(selector).submit();
  $(selector + ' select').attr('disable',true);
}
$(function(){
  ajaxForm($('#new_comment'));
})
function good_bound(){
  var obj = $('#price_good_good_id');
  var obj_good_name = $('#price_good_good_name');
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

function remove_fields(link) {
    $(link).prev("input[type=hidden]").value = "1";
    $(link).parent().hide();
}
function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g");
    $(link).up().insert({
      before: content.replace(regexp, new_id)
    });
}
function toggle_cheap_price(obj){
  if($(obj).attr('checked'))
  {
    $('#div_original_price').show();
  }
  else
  {
    $('#div_original_price').hide();
    $('#original_price').val('');
  }
}
function onchange_type_id(obj){
  var val = parseInt($(obj).val());
  if(val > 1)// && val < 11)
  {
    $('#span_is_cheap_price').hide();
    $('#div_original_price').hide();
    $('#is_cheap_price').attr('checked',false)
    //$('#original_price').val('');
  }
  else
  {
    $('#span_is_cheap_price').show();
  }
}
function price_on_blur(){
  var price = parseFloat($('#price_price').val());
  var amount = parseFloat($('#price_amount').val());
  var total = parseFloat($('#price_total').val());
  if(isNaN(price) && amount && total)
  {
    $('#price_price').val(total / amount);
  }
  if(price && isNaN(amount) && total)
  {
    $('#price_amount').val(total / price);
  }
  if(price  && amount && isNaN(total))
  {
    $('#price_total').val(price * amount);
  }
}

function form_map_init(){
      var mapOptions = {
        center: new google.maps.LatLng(lat, lon),
        zoom: 12,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      };
      var map = new google.maps.Map(document.getElementById('google_map'), mapOptions);

      var input = document.getElementById('form_address');
      var autocomplete = new google.maps.places.Autocomplete(input);

      autocomplete.bindTo('bounds', map);

      var infowindow = new google.maps.InfoWindow();
      var marker = new google.maps.Marker({
        map: map
      });
      //var geocoder;
      //geocoder = new google.maps.Geocoder();
      google.maps.event.addDomListener(map, 'click', 
      function(a){
        marker.setPosition(a.latLng);
        $('#form_lat').val(a.latLng.lat());
        $('#form_lon').val(a.latLng.lng());
        //geocoder.geocode({'latLng': a.latLng}, function(results, status) {
        //  if (status == google.maps.GeocoderStatus.OK) {
        //    if (results[1]) {
        //      $('#form_address').val(results[1].formatted_address)
        //    }
        //  }
        //});
      });

      google.maps.event.addListener(autocomplete, 'place_changed', function() {
        infowindow.close();
        place = autocomplete.getPlace();
        aaa = place;
        if (place.geometry.viewport) {
          map.fitBounds(place.geometry.viewport);
        } else {
          map.setCenter(place.geometry.location);
          map.setZoom(17);  // Why 17? Because it looks good.
        }
        marker.setPosition(place.geometry.location);
        $('#form_lat').val(place.geometry.location.lat());
        $('#form_lon').val(place.geometry.location.lng());

        var address = '';
        if (place.address_components) {
          address = [
            (place.address_components[0] &&
             place.address_components[0].short_name || ''),
            (place.address_components[1] &&
             place.address_components[1].short_name || ''),
            (place.address_components[2] &&
             place.address_components[2].short_name || '')].join(' ');
        }

        infowindow.setContent('<div><b>' + place.name + '</b><br>' + address);
        infowindow.open(map, marker);
      });
}
    function show_map_init() {
      var mapOptions = {
        center: new google.maps.LatLng(lat, lon),
        zoom: 17,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      };
      var map = new google.maps.Map(document.getElementById('google_map'), mapOptions);

      var infowindow = new google.maps.InfoWindow();
      var marker = new google.maps.Marker({
        map: map
      });
      marker.setPosition(new google.maps.LatLng(lat, lon));

    }
