require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get questions_view_url
    assert_response :success
  end

  test "should get edit" do
    get questions_edit_url
    assert_response :success
  end

  test "should get remove" do
    get questions_remove_url
    assert_response :success
  end

end
