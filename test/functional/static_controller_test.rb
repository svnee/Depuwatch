require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  test "should get info" do
    get :info
    assert_response :success
  end

  test "should get faq" do
    get :faq
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get license" do
    get :license
    assert_response :success
  end

  test "should get disclaimer" do
    get :disclaimer
    assert_response :success
  end

end
