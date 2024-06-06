require "test_helper"

class ArtefatosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artefato = artefatos(:one)
  end

  test "should get index" do
    get artefatos_url, as: :json
    assert_response :success
  end

  test "should create artefato" do
    assert_difference('Artefato.count') do
      post artefatos_url, params: { artefato: { name: @artefato.name } }, as: :json
    end

    assert_response 201
  end

  test "should show artefato" do
    get artefato_url(@artefato), as: :json
    assert_response :success
  end

  test "should update artefato" do
    patch artefato_url(@artefato), params: { artefato: { name: @artefato.name } }, as: :json
    assert_response 200
  end

  test "should destroy artefato" do
    assert_difference('Artefato.count', -1) do
      delete artefato_url(@artefato), as: :json
    end

    assert_response 204
  end
end
