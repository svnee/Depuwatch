require 'test_helper'

class TextTopicsControllerTest < ActionController::TestCase
  setup do
    @text_topic = text_topics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:text_topics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create text_topic" do
    assert_difference('TextTopic.count') do
      post :create, :text_topic => @text_topic.attributes
    end

    assert_redirected_to text_topic_path(assigns(:text_topic))
  end

  test "should show text_topic" do
    get :show, :id => @text_topic.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @text_topic.to_param
    assert_response :success
  end

  test "should update text_topic" do
    put :update, :id => @text_topic.to_param, :text_topic => @text_topic.attributes
    assert_redirected_to text_topic_path(assigns(:text_topic))
  end

  test "should destroy text_topic" do
    assert_difference('TextTopic.count', -1) do
      delete :destroy, :id => @text_topic.to_param
    end

    assert_redirected_to text_topics_path
  end
end
