require 'test_helper'

class Userhome::CostsControllerTest < ActionController::TestCase
  setup do
    @userhome_cost = userhome_costs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:userhome_costs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create userhome_cost" do
    assert_difference('Userhome::Cost.count') do
      post :create, userhome_cost: @userhome_cost.attributes
    end

    assert_redirected_to userhome_cost_path(assigns(:userhome_cost))
  end

  test "should show userhome_cost" do
    get :show, id: @userhome_cost
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @userhome_cost
    assert_response :success
  end

  test "should update userhome_cost" do
    put :update, id: @userhome_cost, userhome_cost: @userhome_cost.attributes
    assert_redirected_to userhome_cost_path(assigns(:userhome_cost))
  end

  test "should destroy userhome_cost" do
    assert_difference('Userhome::Cost.count', -1) do
      delete :destroy, id: @userhome_cost
    end

    assert_redirected_to userhome_costs_path
  end
end
