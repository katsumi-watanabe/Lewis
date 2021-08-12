require 'test_helper'

class Admin::ChatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_chats_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_chats_show_url
    assert_response :success
  end

  test "should get create" do
    get admin_chats_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_chats_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_chats_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_chats_destroy_url
    assert_response :success
  end

end
