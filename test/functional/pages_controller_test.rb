require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get about_us" do
    get :about_us
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get terms_of_use" do
    get :terms_of_use
    assert_response :success
  end

  test "should get privacy" do
    get :privacy
    assert_response :success
  end

  test "should get legal_advisor" do
    get :legal_advisor
    assert_response :success
  end

end
