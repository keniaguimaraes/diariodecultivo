require 'test_helper'

class DiarioControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get diario_index_url
    assert_response :success
  end

  test "should get show" do
    get diario_show_url
    assert_response :success
  end

  test "should get edit" do
    get diario_edit_url
    assert_response :success
  end

  test "should get create" do
    get diario_create_url
    assert_response :success
  end

  test "should get update" do
    get diario_update_url
    assert_response :success
  end

  test "should get delete" do
    get diario_delete_url
    assert_response :success
  end

end
