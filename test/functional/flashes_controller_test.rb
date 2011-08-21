require 'test_helper'

class FlashesControllerTest < ActionController::TestCase
  setup do
    @flash = flashes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flashes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flash" do
    assert_difference('Flash.count') do
      post :create, :flash => @flash.attributes
    end

    assert_redirected_to flash_path(assigns(:flash))
  end

  test "should show flash" do
    get :show, :id => @flash.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @flash.to_param
    assert_response :success
  end

  test "should update flash" do
    put :update, :id => @flash.to_param, :flash => @flash.attributes
    assert_redirected_to flash_path(assigns(:flash))
  end

  test "should destroy flash" do
    assert_difference('Flash.count', -1) do
      delete :destroy, :id => @flash.to_param
    end

    assert_redirected_to flashes_path
  end
end
