class PriceGoodsController < ApplicationController
  respond_to :js#,:html
  #def index
    #@price_goods = PriceGood.all
  #end

  def show
    @price_good = PriceGood.find(params[:id])
  end

  def new
    @price_good = PriceGood.new
    @price_good.build_good
    @price_good.build_price
  end

  def create
    @price_good = current_user.price_goods.new(params[:price_good])
    @price_good.good.user_id = current_user.id
    if @price_good.save
    else
    end
  end

  def edit
    @price_good = PriceGood.find(params[:id])
  end

  def update
    @price_good = PriceGood.find(params[:id])
    if @price_good.update_attributes(params[:price_good])
      respond_to :js
    else
      render :action => 'edit'
    end
  end

  def destroy
    @price_good = PriceGood.find(params[:id])
    @price_good.destroy
    redirect_to price_goods_url, :notice => "Successfully destroyed price goods."
  end
end
