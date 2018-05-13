require 'test_helper'

class ReporterControllerTest < ActionDispatch::IntegrationTest
  test "should get doctor_by_appointment" do
    get reporter_doctor_by_appointment_url
    assert_response :success
  end

end
