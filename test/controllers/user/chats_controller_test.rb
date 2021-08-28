require 'test_helper'

class User::ChatsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_chats_show_url
    assert_response :success
  end

  test "should get create" do
    get user_chats_create_url
    assert_response :success
  end

  test "should get edit" do
    get user_chats_edit_url
    assert_response :success
  end

  test "should get update" do
    get user_chats_update_url
    assert_response :success
  end

  test "should get destroy" do
    get user_chats_destroy_url
    assert_response :success
  end
end
