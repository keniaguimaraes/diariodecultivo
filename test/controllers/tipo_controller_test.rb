require 'test_helper'

class TipoControllerTest < ActionDispatch::IntegrationTest
  test "should get descricao:string" do
    get tipo_descricao:string_url
    assert_response :success
  end

end
