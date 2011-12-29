class PricesController < ApplicationController
  before_filter :authenticate_user!,:except =>[:index,:show]
  before_filter :find_able#, :except => [:update,:create]
  # GET /prices
  # GET /prices.xml
  def index
    @prices = @able.blank? ? Price.scoped : @able.prices

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prices }
    end
  end

  # GET /prices/1
  # GET /prices/1.xml
  def show
    @price = @able.blank? ? Price.find(params[:id]) : @able.prices.find(params[:id])
    @commentable = @price
    @reviewable = @price

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @price }
    end
  end

  # GET /prices/new
  # GET /prices/new.xml
  def new
    if @able.blank?
      @price =  Price.new  
      @price.goods.new
    else
      @price = @able.prices.build params[:price]
    end
    self.type_id = -1 if params[:price] and params[:price][:type_id] == -1

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @price }
    end
  end

  # GET /prices/1/edit
#  def edit
#    @price = @able.blank? ? Price. : @able.prices.find(params[:id])
#  end

  # POST /prices
  # POST /prices.xml
  def create
    @price = current_user.prices.build(params[:price]) 
    @price.good_id = @able.id if @price.good_id.nil? and !@able.nil?
      if @price.save
        redirect_to(@price, :notice => 'Price was successfully created.')
      else
        render :action => "new"
      end
  end

  # PUT /prices/1
  # PUT /prices/1.xml
   def update
     @price =  Price.find(params[:id])
     params[:price][:good_user_id] = current_user.id
 
     respond_to do |format|
       if @price.update_attributes(params[:price])
         format.html { redirect_to([@good,@price], :notice => 'Price was successfully updated.') }
         format.xml  { head :ok }
       else
         format.html { render :action => "edit" }
         format.xml  { render :xml => @price.errors, :status => :unprocessable_entity }
       end
     end
   end

end
