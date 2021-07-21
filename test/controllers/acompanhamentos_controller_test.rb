require 'test_helper'

class AcompanhamentosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get acompanhamentos_index_url
    assert_response :success
  end

  test "should get edit" do
    get acompanhamentos_edit_url
    assert_response :success
  end

  test "should get create" do
    get acompanhamentos_create_url
    assert_response :success
  end

  test "should get update" do
    get acompanhamentos_update_url
    assert_response :success
  end

  test "should get delete" do
    get acompanhamentos_delete_url
    assert_response :success
  end

end
