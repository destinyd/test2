class GoodsController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  # GET /goods
  # GET /goods.xml
  def index
    @goods = Good.order(sort_column + ' ' + sort_direction).paginate(:per_page => 10, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @goods }
      format.js
    end
  end

  # GET /goods/1
  # GET /goods/1.xml
  def show
    @good = Good.find(params[:id])
    @prices = @good.prices.paginate(:per_page => 10, :page => params[:page])
    @uploads  = @good.uploads
    
    @commentable = @good
    @reviewable = @good

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @good }
    end
  end

  # GET /goods/new
  # GET /goods/new.xml
  def new
    @good = current_user.goods.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @good }
    end
  end

  # GET /goods/1/edit
  def edit
    @good = current_user.goods.find(params[:id])
  end

  # POST /goods
  # POST /goods.xml
  def create
    @good = current_user.goods.build(params[:good])

    respond_to do |format|
      if @good.save
        format.html { redirect_to(@good, :notice => 'Good was successfully created.') }
        format.xml  { render :xml => @good, :status => :created, :location => @good }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @good.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /goods/1
  # PUT /goods/1.xml
  def update
    @good = current_user.goods.find(params[:id])

    respond_to do |format|
      if @good.update_attributes(params[:good])
        format.html { redirect_to(@good, :notice => 'Good was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @good.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /goods/1
  # DELETE /goods/1.xml
#  def destroy
#    @good = Good.find(params[:id])
#    @good.destroy
#
#    respond_to do |format|
#      format.html { redirect_to(goods_url) }
#      format.xml  { head :ok }
#    end
#  end

end
