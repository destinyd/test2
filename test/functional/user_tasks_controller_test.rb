require 'test_helper'

class UserTasksControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => UserTask.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    UserTask.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    UserTask.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to user_task_url(assigns(:user_task))
  end

  def test_edit
    get :edit, :id => UserTask.first
    assert_template 'edit'
  end

  def test_update_invalid
    UserTask.any_instance.stubs(:valid?).returns(false)
    put :update, :id => UserTask.first
    assert_template 'edit'
  end

  def test_update_valid
    UserTask.any_instance.stubs(:valid?).returns(true)
    put :update, :id => UserTask.first
    assert_redirected_to user_task_url(assigns(:user_task))
  end

  def test_destroy
    user_task = UserTask.first
    delete :destroy, :id => user_task
    assert_redirected_to user_tasks_url
    assert !UserTask.exists?(user_task.id)
  end
end
