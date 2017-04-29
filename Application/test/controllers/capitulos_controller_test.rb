require 'test_helper'

class CapitulosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @capitulo = capitulos(:one)
  end

  test "should get index" do
    get capitulos_url
    assert_response :success
  end

  test "should get new" do
    get new_capitulo_url
    assert_response :success
  end

  test "should create capitulo" do
    assert_difference('Capitulo.count') do
      post capitulos_url, params: { capitulo: { duracion: @capitulo.duracion, nombre: @capitulo.nombre, resumen: @capitulo.resumen } }
    end

    assert_redirected_to capitulo_url(Capitulo.last)
  end

  test "should show capitulo" do
    get capitulo_url(@capitulo)
    assert_response :success
  end

  test "should get edit" do
    get edit_capitulo_url(@capitulo)
    assert_response :success
  end

  test "should update capitulo" do
    patch capitulo_url(@capitulo), params: { capitulo: { duracion: @capitulo.duracion, nombre: @capitulo.nombre, resumen: @capitulo.resumen } }
    assert_redirected_to capitulo_url(@capitulo)
  end

  test "should destroy capitulo" do
    assert_difference('Capitulo.count', -1) do
      delete capitulo_url(@capitulo)
    end

    assert_redirected_to capitulos_url
  end
end
