require 'test_helper'

class FocusControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Focus.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Focus.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Focus.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to focus_url(assigns(:focus))
  end

  def test_edit
    get :edit, :id => Focus.first
    assert_template 'edit'
  end

  def test_update_invalid
    Focus.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Focus.first
    assert_template 'edit'
  end

  def test_update_valid
    Focus.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Focus.first
    assert_redirected_to focus_url(assigns(:focus))
  end

  def test_destroy
    focus = Focus.first
    delete :destroy, :id => focus
    assert_redirected_to focus_url
    assert !Focus.exists?(focus.id)
  end
end
