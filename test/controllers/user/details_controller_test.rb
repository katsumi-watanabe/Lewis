require 'test_helper'

class User::DetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_details_show_url
    assert_response :success
  end

  test "should get edit" do
    get user_details_edit_url
    assert_response :success
  end

  test "should get update" do
    get user_details_update_url
    assert_response :success
  end
end
