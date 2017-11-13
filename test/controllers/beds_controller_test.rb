require 'test_helper'

class BedsControllerTest < ActionController::TestCase
  setup do
    @bed = beds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:beds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bed" do
    assert_difference('Bed.count') do
      post :create, bed: { bed_number: @bed.bed_number, booked: @bed.booked, expected_booking_date: @bed.expected_booking_date, expected_vacancy_date: @bed.expected_vacancy_date, room_id: @bed.room_id, user_id: @bed.user_id }
    end

    assert_redirected_to bed_path(assigns(:bed))
  end

  test "should show bed" do
    get :show, id: @bed
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bed
    assert_response :success
  end

  test "should update bed" do
    patch :update, id: @bed, bed: { bed_number: @bed.bed_number, booked: @bed.booked, expected_booking_date: @bed.expected_booking_date, expected_vacancy_date: @bed.expected_vacancy_date, room_id: @bed.room_id, user_id: @bed.user_id }
    assert_redirected_to bed_path(assigns(:bed))
  end

  test "should destroy bed" do
    assert_difference('Bed.count', -1) do
      delete :destroy, id: @bed
    end

    assert_redirected_to beds_path
  end
end
