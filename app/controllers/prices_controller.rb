class PricesController < ApplicationController
  before_filter :authenticate_user!,:except =>[:index,:show]
  before_filter :get_good#, :except => [:update,:create]
  # GET /prices
  # GET /prices.xml
  def index
    @prices = @good.prices

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prices }
    end
  end

  # GET /prices/1
  # GET /prices/1.xml
  def show
    @price = @good.prices.find(params[:id])
    @commentable = @price

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @price }
    end
  end

  # GET /prices/new
  # GET /prices/new.xml
  def new
    #@good = Good.find(params[:good_id])
    @price = @good.prices.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @price }
    end
  end

  # GET /prices/1/edit
  def edit
    @price = @good.prices.find(params[:id])
  end

  # POST /prices
  # POST /prices.xml
  def create
    #@good = Good.find(params[:good_id])
    #@good = Good.find(good_id)
    @price = @good.prices.build(params[:price])
    @price.user = current_user

      if @price.save
        redirect_to([@price.good,@price], :notice => 'Price was successfully created.')
      else
        render :action => "new"
      end
  end

  # PUT /prices/1
  # PUT /prices/1.xml
  def update
    @price = @good.prices.find(params[:id])

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

  # DELETE /prices/1
  # DELETE /prices/1.xml
  def destroy
    @price = @good.prices.find(params[:id])
    @price.destroy

    respond_to do |format|
      format.html { redirect_to(good_prices_url) }
      format.xml  { head :ok }
    end
  end
  
  private
    def get_good
      good_id = params[:good_id]
      @good = Good.find(good_id)
    end
end
