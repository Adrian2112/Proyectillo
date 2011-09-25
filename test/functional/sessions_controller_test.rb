require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Usuario.stubs(:authenticate).returns(nil)
    post :create
    assert_template 'new'
    assert_nil session['usuario_id']
  end

  def test_create_valid
    Usuario.stubs(:authenticate).returns(Usuario.first)
    post :create
    assert_redirected_to "/"
    assert_equal Usuario.first.id, session['usuario_id']
  end
end
