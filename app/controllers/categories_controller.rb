class CategoriesController < ApplicationController
  helper_method :sort_column, :sort_direction
  # GET /categories
  # GET /categories.xml
  def index
    @categories = Category.roots.valids

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.xml
  def show
    @category = Category.find(params[:id])
    @categories = @category.children
    @categories = Category.same_parent(@category.parent_id)  if @categories.blank?
    @flashes = @category.flashes.recent
    @flashes = Flash.recent if @flashes.blank?
    @articles = @category.articles.recent
    @cheapest =     Price.cheapest
    @recent_goods = @category.goods.recent
    @recent_users    = User.recent
    @comments = Comment.recent
    @integrals  = []
    @uploads  = Upload.recent

  end

  # GET /categories/new
  # GET /categories/new.xml
  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @category }
    end
  end

  # GET /categories/1/edit
#  def edit
#    @category = Category.find(params[:id])
#  end

  # POST /categories
  # POST /categories.xml
  def create
    @category = Category.new(params[:category])
    respond_to do |format|
     if @category.save
        format.html { redirect_to(@category, :notice => 'Category was successfully created.') }
        format.xml  { render :xml => @category, :status => :created, :location => @category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.xml
#  def update
#    @category = Category.find(params[:id])

#    respond_to do |format|
#      if @category.update_attributes(params[:category])
#        format.html { redirect_to(@category, :notice => 'Category was successfully updated.') }
#        format.xml  { head :ok }
#      else
#        format.html { render :action => "edit" }
#        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
#      end
#    end
#  end
  
#  def destroy
#    @category = Category.find(params[:id])
#    @category.destroy
#
#    respond_to do |format|
#      format.html { redirect_to(categories_url) }
#      format.xml  { head :ok }
#    end
#  end
end
