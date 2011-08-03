require 'test_helper'

class LegislationsControllerTest < ActionController::TestCase
  setup do
    @legislation = legislations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:legislations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create legislation" do
    assert_difference('Legislation.count') do
      post :create, :legislation => @legislation.attributes
    end

    assert_redirected_to legislation_path(assigns(:legislation))
  end

  test "should show legislation" do
    get :show, :id => @legislation.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @legislation.to_param
    assert_response :success
  end

  test "should update legislation" do
    put :update, :id => @legislation.to_param, :legislation => @legislation.attributes
    assert_redirected_to legislation_path(assigns(:legislation))
  end

  test "should destroy legislation" do
    assert_difference('Legislation.count', -1) do
      delete :destroy, :id => @legislation.to_param
    end

    assert_redirected_to legislations_path
  end
end
