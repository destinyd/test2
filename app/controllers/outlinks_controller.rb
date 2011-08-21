class OutlinksController < ApplicationController
  # GET /outlinks
  # GET /outlinks.xml
  def index
    @outlinks = Outlink.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @outlinks }
    end
  end

  # GET /outlinks/1
  # GET /outlinks/1.xml
  def show
    @outlink = Outlink.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @outlink }
    end
  end

  # GET /outlinks/new
  # GET /outlinks/new.xml
  def new
    @outlink = Outlink.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @outlink }
    end
  end

  # GET /outlinks/1/edit
  def edit
    @outlink = Outlink.find(params[:id])
  end

  # POST /outlinks
  # POST /outlinks.xml
  def create
    @outlink = Outlink.new(params[:outlink])

    respond_to do |format|
      if @outlink.save
        format.html { redirect_to(@outlink, :notice => 'Outlink was successfully created.') }
        format.xml  { render :xml => @outlink, :status => :created, :location => @outlink }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @outlink.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /outlinks/1
  # PUT /outlinks/1.xml
  def update
    @outlink = Outlink.find(params[:id])

    respond_to do |format|
      if @outlink.update_attributes(params[:outlink])
        format.html { redirect_to(@outlink, :notice => 'Outlink was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @outlink.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /outlinks/1
  # DELETE /outlinks/1.xml
  def destroy
    @outlink = Outlink.find(params[:id])
    @outlink.destroy

    respond_to do |format|
      format.html { redirect_to(outlinks_url) }
      format.xml  { head :ok }
    end
  end
end
