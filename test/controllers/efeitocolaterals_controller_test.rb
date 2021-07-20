require 'test_helper'

class EfeitocolateralsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @efeitocolateral = efeitocolaterals(:one)
  end

  test "should get index" do
    get efeitocolaterals_url
    assert_response :success
  end

  test "should get new" do
    get new_efeitocolateral_url
    assert_response :success
  end

  test "should create efeitocolateral" do
    assert_difference('Efeitocolateral.count') do
      post efeitocolaterals_url, params: { efeitocolateral: { descricao: @efeitocolateral.descricao } }
    end

    assert_redirected_to efeitocolateral_url(Efeitocolateral.last)
  end

  test "should show efeitocolateral" do
    get efeitocolateral_url(@efeitocolateral)
    assert_response :success
  end

  test "should get edit" do
    get edit_efeitocolateral_url(@efeitocolateral)
    assert_response :success
  end

  test "should update efeitocolateral" do
    patch efeitocolateral_url(@efeitocolateral), params: { efeitocolateral: { descricao: @efeitocolateral.descricao } }
    assert_redirected_to efeitocolateral_url(@efeitocolateral)
  end

  test "should destroy efeitocolateral" do
    assert_difference('Efeitocolateral.count', -1) do
      delete efeitocolateral_url(@efeitocolateral)
    end

    assert_redirected_to efeitocolaterals_url
  end
end
