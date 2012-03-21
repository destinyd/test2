class GoodsController < ApplicationController
  #layout 'side',:on => [:show]
  before_filter :authenticate_user!, :only => [:new,:create,:edit,:update,:destroy]
  helper_method :sort_column, :sort_direction
  respond_to :html, :json
  
  # GET /goods
  # GET /goods.xml
  def index
    #@goods = Good.search(params[:term]).order(sort_column + ' ' + sort_direction).paginate(:per_page => 10, :page => params[:page])
    @goods = Good.search(params[:term]).paginate(:per_page => 10, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { 
        @term = @goods.map{ |g|  { :value => g.name, :id => g.id}}
        render :json => @term
      }
      format.js
    end
  end

  # GET /goods/1
  # GET /goods/1.xml
  def show
    @good = Good.find(params[:id])
    @prices = @good.prices.paginate(:per_page => 10, :page => params[:page])
    @uploads  = @good.uploads
    @links  = @good.outlinks
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @good }
    end
  end

  # GET /goods/new
  # GET /goods/new.xml
  def new
    @good = current_user.goods.build
    @good.outlinks.build

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
        format.html { redirect_to(@good, :notice => t('notice.create_success')) }
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
    @good.update_attributes(params[:good])
    respond_with @good

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

  def tags
    @tags = Good.tag_counts.includes(:taggings)
  end

  def tag
    @tagname = params[:id]
    @taggables  = Good.tagged_with params[:id]
  end

end
