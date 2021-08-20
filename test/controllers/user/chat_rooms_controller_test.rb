require 'test_helper'

class User::ChatRoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get user_chat_rooms_update_url
    assert_response :success
  end

end
