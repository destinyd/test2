$(document).ready(function() {
    $('#price_good_good_name').autocomplete({
      source: '/goods.json',
      minLength: 2,
      select: function(e,ui){
        $('#price_good_good_id').val(ui['item']['id']);
      },
      change: function(e,ui){
        $('#price_good_good_id').val('');
      }
    });
});

