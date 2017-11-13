$(document).ready( function() {
  cities = $('#pg_city_id').html();
  areas = $('#pg_area_id').html();
  $('#pg_city_id').parent().hide();
  $('#pg_area_id').parent().hide();
  function checkState() {
    if($('#pg_state_id').val() == ""){
      $('#pg_city_id').parent().hide();
    } else {
      $('#pg_city_id').parent().show();
    }
  }
  function checkCity() {
    if($('#pg_city_id').val() == ""){
      $('#pg_area_id').parent().hide();
    } else {
      $('#pg_area_id').parent().show();
    }
  }
  function checkArea() {
    if($('#pg_area_id').val() == ""){
      
    } else {
      
    }
  }
  $('#pg_state_id').change(function() {
    checkState();
    state = $('#pg_state_id :selected').text();
    city = $(cities).filter("optgroup[label = '" + state + "']").html();
    if(city){
      $('#pg_city_id').html(city);
      $("#pg_city_id").prepend("<option value=''>Select City</option>");
      $('#pg_city_id').val('');
    }
  })
  $('#pg_city_id').change(function() {
    checkCity();
    city = $('#pg_city_id :selected').text();
    area = $(areas).filter("optgroup[label = '" + city + "']").html();
    if(area){
      $('#pg_area_id').html(area);
      $("#pg_area_id").prepend("<option value=''>Select Area</option>");
      $('#pg_area_id').val('');
    }
  })
})
