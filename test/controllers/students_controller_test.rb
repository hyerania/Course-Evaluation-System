require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get hello" do
    get students_hello_url
    assert_response :success
  end

end
