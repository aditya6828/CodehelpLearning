require "test_helper"

class ConfirmEmailControllerTest < ActionDispatch::IntegrationTest
  test "should get verify_otp" do
    get confirm_email_verify_otp_url
    assert_response :success
  end
end
