$(document).ready(function() {
  function hideBedExpectedBookingDate() {
  	$('#bed_expected_booking_date_1i').parent().hide();
  }
  function showBedExpectedBookingDate() {
  	$('#bed_expected_booking_date_1i').parent().show();
  }
  function hideBedExpectedVacancyDate() {
  	$('#bed_expected_vacancy_date_1i').parent().hide();
  }
  function showBedExpectedVacancyDate() {
  	$('#bed_expected_vacancy_date_1i').parent().show();
  }
  hideBedExpectedBookingDate();
  hideBedExpectedVacancyDate();
  $('#bed_booked').change(function(){
    if($('#bed_booked').is(':checked')){
      showBedExpectedVacancyDate();
    } else {
      hideBedExpectedVacancyDate();
    }
  })
  $('#bed_user_id').change(function(){
    if($('#bed_user_id').val() == ""){
      hideBedExpectedBookingDate();
    } else {
      showBedExpectedBookingDate();
    }
  })
})