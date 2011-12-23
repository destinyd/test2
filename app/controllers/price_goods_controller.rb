class PriceGoodsController < ApplicationController
  #def index
    #@price_goods = PriceGood.all
  #end

  def show
    @price_goods = PriceGood.find(params[:id])
  end

  def new
    @price_goods = PriceGood.new
    @price_goods.build_good
    @price_goods.build_price
  end

  def create
    @price_goods = PriceGood.new(params[:price_goods])
    if @price_goods.save
      redirect_to @price_goods, :notice => "Successfully created price goods."
    else
      render :action => 'new'
    end
  end

  def edit
    @price_goods = PriceGood.find(params[:id])
  end

  def update
    @price_goods = PriceGood.find(params[:id])
    if @price_goods.update_attributes(params[:price_goods])
      redirect_to @price_goods, :notice  => "Successfully updated price goods."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @price_goods = PriceGood.find(params[:id])
    @price_goods.destroy
    redirect_to price_goods_url, :notice => "Successfully destroyed price goods."
  end
end
