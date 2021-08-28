require 'test_helper'

class User::PostSneakersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_post_sneakers_index_url
    assert_response :success
  end

  test "should get edit" do
    get user_post_sneakers_edit_url
    assert_response :success
  end

  test "should get show" do
    get user_post_sneakers_show_url
    assert_response :success
  end

  test "should get new" do
    get user_post_sneakers_new_url
    assert_response :success
  end

  test "should get update" do
    get user_post_sneakers_update_url
    assert_response :success
  end

  test "should get delete" do
    get user_post_sneakers_delete_url
    assert_response :success
  end
end
