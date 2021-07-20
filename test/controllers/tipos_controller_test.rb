require 'test_helper'

class TiposControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tipos_index_url
    assert_response :success
  end

  test "should get new" do
    get tipos_new_url
    assert_response :success
  end

  test "should get edit" do
    get tipos_edit_url
    assert_response :success
  end

  test "should get create" do
    get tipos_create_url
    assert_response :success
  end

  test "should get update" do
    get tipos_update_url
    assert_response :success
  end

  test "should get destroy" do
    get tipos_destroy_url
    assert_response :success
  end

end
