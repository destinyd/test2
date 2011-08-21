require 'test_helper'

class OutlinksControllerTest < ActionController::TestCase
  setup do
    @outlink = outlinks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:outlinks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create outlink" do
    assert_difference('Outlink.count') do
      post :create, :outlink => @outlink.attributes
    end

    assert_redirected_to outlink_path(assigns(:outlink))
  end

  test "should show outlink" do
    get :show, :id => @outlink.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @outlink.to_param
    assert_response :success
  end

  test "should update outlink" do
    put :update, :id => @outlink.to_param, :outlink => @outlink.attributes
    assert_redirected_to outlink_path(assigns(:outlink))
  end

  test "should destroy outlink" do
    assert_difference('Outlink.count', -1) do
      delete :destroy, :id => @outlink.to_param
    end

    assert_redirected_to outlinks_path
  end
end
