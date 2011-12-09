require 'test_helper'

class MyTasksControllerTest < ActionController::TestCase
  setup do
    @my_task = my_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:my_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create my_task" do
    assert_difference('MyTask.count') do
      post :create, my_task: @my_task.attributes
    end

    assert_redirected_to my_task_path(assigns(:my_task))
  end

  test "should show my_task" do
    get :show, id: @my_task.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @my_task.to_param
    assert_response :success
  end

  test "should update my_task" do
    put :update, id: @my_task.to_param, my_task: @my_task.attributes
    assert_redirected_to my_task_path(assigns(:my_task))
  end

  test "should destroy my_task" do
    assert_difference('MyTask.count', -1) do
      delete :destroy, id: @my_task.to_param
    end

    assert_redirected_to my_tasks_path
  end
end
