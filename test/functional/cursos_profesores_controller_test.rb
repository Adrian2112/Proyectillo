require 'test_helper'

class CursosProfesoresControllerTest < ActionController::TestCase
  setup do
    @curso_profesor = cursos_profesores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cursos_profesores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create curso_profesor" do
    assert_difference('CursoProfesor.count') do
      post :create, :curso_profesor => @curso_profesor.attributes
    end

    assert_redirected_to curso_profesor_path(assigns(:curso_profesor))
  end

  test "should show curso_profesor" do
    get :show, :id => @curso_profesor.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @curso_profesor.to_param
    assert_response :success
  end

  test "should update curso_profesor" do
    put :update, :id => @curso_profesor.to_param, :curso_profesor => @curso_profesor.attributes
    assert_redirected_to curso_profesor_path(assigns(:curso_profesor))
  end

  test "should destroy curso_profesor" do
    assert_difference('CursoProfesor.count', -1) do
      delete :destroy, :id => @curso_profesor.to_param
    end

    assert_redirected_to cursos_profesores_path
  end
end
