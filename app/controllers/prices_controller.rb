class PricesController < ApplicationController
  before_filter :authenticate_user!,:only =>[:new,:create,:update]
  before_filter :find_able_and_prices, :except => [:update,:create]
  respond_to :html,:js
  def index
    @prices = @prices.paginate( :page => params[:page])
  end

  def show
    @price = @prices.find(params[:id])
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
    @prices = @prices.paginate( :page => params[:page])
    render :action => "index"
  end

  def groupbuy
    @prices = @prices.paginate( :page => params[:page])
    render :action => "index"
  end

  def costs
    @prices = @prices.paginate( :page => params[:page])
    render :action => "index"
  end

  private
  def find_able_and_prices
    params.each do |name, value|
      if name =~ /(.+)_id$/
        if $1 == 'city'
          @able = $1.classify.constantize.where(:name =>value).limit(1).first
          @prices = Price
        else
          @able = $1.classify.constantize.find(value) 
          @prices = @able.prices
        end 
        @prices = @prices.send action_name if ['cheapest','groupbuy','costs'].include? action_name
        @prices = @prices.recent if action_name == 'index'
        @prices = @prices.near(value,20) if $1 == 'city'
        return @prices.with_uploads
      end  
    end  
    @prices = Price.send action_name if ['cheapest','groupbuy','costs'].include? action_name
    @prices = Price.recent if action_name == 'index'
    @prices = @prices.with_uploads
  end
end
