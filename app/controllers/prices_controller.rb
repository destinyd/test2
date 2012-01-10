class PricesController < ApplicationController
  before_filter :authenticate_user!,:only =>[:new,:create,:update]
  before_filter :find_able#, :except => [:update,:create]
  respond_to :html
  def index
    @prices = @able.blank? ? Price.recent.paginate( :page => params[:page]) : @able.prices.paginate( :page => params[:page])
  end

  def show
    @price = @able.blank? ? Price.find(params[:id]) : @able.prices.find(params[:id])
    @commentable = @price
    @reviewable = @price
  end

  def new
    if @able.blank?
      @price =  Price.new  
      #@price.goods.new
    else
      @price = @able.prices.build
    end
  end

  # GET /prices/1/edit
  #  def edit
  #    @price = @able.blank? ? Price. : @able.prices.find(params[:id])
  #  end

  def create
    @price = current_user.prices.build(params[:price]) 
    @price.good_id = @able.id if @price.good_id.nil? and !@able.nil?
    if @price.save
      redirect_to(@price, :notice => 'Price was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @price =  Price.find(params[:id])
    params[:price][:good_user_id] = current_user.id

    if @price.update_attributes(params[:price])
      format.html { redirect_to([@good,@price], :notice => 'Price was successfully updated.') }
    else
      format.html { render :action => "edit" }
    end
  end

  def cheapest
    @prices = @able.blank? ? Price.cheapest.paginate( :page => params[:page]) : @able.prices.cheapest.paginate( :page => params[:page])
    render :action => "index"
  end

  def groupbuy
    @prices = @able.blank? ? Price.groupbuy.paginate( :page => params[:page]) : @able.prices.groupbuy.paginate( :page => params[:page])
    render :action => "index"
  end

  def local
    @prices = @able.blank? ? Price.local.paginate( :page => params[:page]) : @able.prices.local.paginate( :page => params[:page])
    render :action => "index"
  end

end
