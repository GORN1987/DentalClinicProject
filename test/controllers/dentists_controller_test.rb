require 'test_helper'

class DentistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dentist = dentists(:one)
  end

  test "should get index" do
    get dentists_url
    assert_response :success
  end

  test "should get new" do
    get new_dentist_url
    assert_response :success
  end

  test "should create dentist" do
    assert_difference('Dentist.count') do
      post dentists_url, params: { dentist: { dental_number: @dentist.dental_number, email: @dentist.email, is_active: @dentist.is_active, name: @dentist.name, phone_number: @dentist.phone_number } }
    end

    assert_redirected_to dentist_url(Dentist.last)
  end

  test "should show dentist" do
    get dentist_url(@dentist)
    assert_response :success
  end

  test "should get edit" do
    get edit_dentist_url(@dentist)
    assert_response :success
  end

  test "should update dentist" do
    patch dentist_url(@dentist), params: { dentist: { dental_number: @dentist.dental_number, email: @dentist.email, is_active: @dentist.is_active, name: @dentist.name, phone_number: @dentist.phone_number } }
    assert_redirected_to dentist_url(@dentist)
  end

  test "should destroy dentist" do
    assert_difference('Dentist.count', -1) do
      delete dentist_url(@dentist)
    end

    assert_redirected_to dentists_url
  end
end
