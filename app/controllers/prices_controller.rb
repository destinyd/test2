class PricesController < ApplicationController
  before_filter :authenticate_user!,:only =>[:new,:create,:update,:edit,:buy_one]
  before_filter :find_able_and_prices, :except => [:update,:create,:new,:edit,:destroy]
  respond_to :html,:js
  #caches_action :index, :show
  #cache_sweeper :price_sweeper,:only => [:index,:show]
  def index
    @prices = @prices.includes(:good).paginate( :page => params[:page])
  end

  def show
    @price = @prices.find(params[:id])
  end

  def new
    if @able
      @price = @able.prices.build
    else
      @price =  Price.new
    end
  end

  # GET /prices/1/edit
  #  def edit
  #    @price = @able.blank? ? Price. : @able.prices.find(params[:id])
  #  end

  def create
    @price = current_user.prices.build(params[:price]) 
    if @price.save
      redirect_to(@price, :notice => t('notice.create_success'))
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
    @prices = @prices.includes(:good).paginate( :page => params[:page])
    render :action => "index"
  end

  def groupbuy
    @prices = @prices.includes(:good).paginate( :page => params[:page])
    render :action => "index"
  end

  def costs
    @prices = @prices.includes(:good).paginate( :page => params[:page])
    render :action => "index"
  end

  def buy_one
    price = Price.find(params[:id])
    @price = current_user.prices.new :type_id => 0,
      :price => price.price,
      :address => price.address,
      :latitude => price.latitude,
      :longitude => price.longitude
    @price.good_id = price.good_id
    @price.save
    redirect_to @price
  end

  private
  def find_able_and_prices
    @prices = Price
    params.each do |name, value|
      if name =~ /(.+)_id$/
        if $1 == 'city'
          @able = $1.classify.constantize.where(:name =>value).first
          loc = @able.lat,@able.lon
        elsif $1 == 'locate'
          @able = $1.classify.constantize.where(:name =>value).first
          @able = Locate.create(:name => value) unless @able
          loc = @able.lat,@able.lon
        else
          @able = $1.classify.constantize.find(value) 
          @prices = @able.prices
        end 
      @prices = @prices.send action_name if ['cheapest','groupbuy','costs'].include? action_name
      @prices = @prices.recent if action_name == 'index'
      @prices = @prices.near(loc,20) if $1 == 'city' or $1 == 'locate'
      return @prices#with_uploads
      end  
    end  
    @prices = Price.send action_name if ['cheapest','groupbuy','costs'].include? action_name
    @prices = Price.recent if action_name == 'index'
    @prices = @prices#.with_uploads
  end
end
