require 'test_helper'

class PriceGoodsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => PriceGoods.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    PriceGoods.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    PriceGoods.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to price_goods_url(assigns(:price_goods))
  end

  def test_edit
    get :edit, :id => PriceGoods.first
    assert_template 'edit'
  end

  def test_update_invalid
    PriceGoods.any_instance.stubs(:valid?).returns(false)
    put :update, :id => PriceGoods.first
    assert_template 'edit'
  end

  def test_update_valid
    PriceGoods.any_instance.stubs(:valid?).returns(true)
    put :update, :id => PriceGoods.first
    assert_redirected_to price_goods_url(assigns(:price_goods))
  end

  def test_destroy
    price_goods = PriceGoods.first
    delete :destroy, :id => price_goods
    assert_redirected_to price_goods_url
    assert !PriceGoods.exists?(price_goods.id)
  end
end
