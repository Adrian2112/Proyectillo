require 'test_helper'

class CursoProfesorControllerTest < ActionController::TestCase
  test "should get curso_profesor" do
    get :curso_profesor
    assert_response :success
  end

end
