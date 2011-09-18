require 'test_helper'

class CampusControllerTest < ActionController::TestCase
  setup do
    @campus = campus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:campus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create campus" do
    assert_difference('Campus.count') do
      post :create, :campus => @campus.attributes
    end

    assert_redirected_to campus_path(assigns(:campus))
  end

  test "should show campus" do
    get :show, :id => @campus.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @campus.to_param
    assert_response :success
  end

  test "should update campus" do
    put :update, :id => @campus.to_param, :campus => @campus.attributes
    assert_redirected_to campus_path(assigns(:campus))
  end

  test "should destroy campus" do
    assert_difference('Campus.count', -1) do
      delete :destroy, :id => @campus.to_param
    end

    assert_redirected_to campus_index_path
  end
end
