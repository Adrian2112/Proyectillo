require 'test_helper'

class AutenticacionesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_create_invalid
    Autenticacion.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Autenticacion.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to autenticaciones_url
  end

  def test_destroy
    autenticacion = Autenticacion.first
    delete :destroy, :id => autenticacion
    assert_redirected_to autenticaciones_url
    assert !Autenticacion.exists?(autenticacion.id)
  end
end
