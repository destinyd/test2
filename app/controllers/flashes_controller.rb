class FlashesController < ApplicationController
  # GET /flashes
  # GET /flashes.xml
  def index
    @flashes = Flash.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @flashes }
    end
  end

  # GET /flashes/1
  # GET /flashes/1.xml
  def show
    @flash = Flash.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @flash }
    end
  end

  # GET /flashes/new
  # GET /flashes/new.xml
  def new
    @flash = Flash.new
    @flash.build_outlink

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @flash }
    end
  end

  # GET /flashes/1/edit
  def edit
    @flash = Flash.find(params[:id])
  end

  # POST /flashes
  # POST /flashes.xml
  def create
    @flash = Flash.new(params[:flash])

    respond_to do |format|
      if @flash.save
        format.html { redirect_to(@flash, :notice => 'Flash was successfully created.') }
        format.xml  { render :xml => @flash, :status => :created, :location => @flash }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @flash.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /flashes/1
  # PUT /flashes/1.xml
  def update
    @flash = Flash.find(params[:id])

    respond_to do |format|
      if @flash.update_attributes(params[:flash])
        format.html { redirect_to(@flash, :notice => 'Flash was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @flash.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /flashes/1
  # DELETE /flashes/1.xml
  def destroy
    @flash = Flash.find(params[:id])
    @flash.destroy

    respond_to do |format|
      format.html { redirect_to(flashes_url) }
      format.xml  { head :ok }
    end
  end
end
