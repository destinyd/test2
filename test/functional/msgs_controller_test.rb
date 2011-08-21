require 'test_helper'

class MsgsControllerTest < ActionController::TestCase
  setup do
    @msg = msgs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:msgs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create msg" do
    assert_difference('Msg.count') do
      post :create, :msg => @msg.attributes
    end

    assert_redirected_to msg_path(assigns(:msg))
  end

  test "should show msg" do
    get :show, :id => @msg.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @msg.to_param
    assert_response :success
  end

  test "should update msg" do
    put :update, :id => @msg.to_param, :msg => @msg.attributes
    assert_redirected_to msg_path(assigns(:msg))
  end

  test "should destroy msg" do
    assert_difference('Msg.count', -1) do
      delete :destroy, :id => @msg.to_param
    end

    assert_redirected_to msgs_path
  end
end
