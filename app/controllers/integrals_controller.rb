class IntegralsController < ApplicationController
  # GET /integrals
  # GET /integrals.xml
  def index
    @integrals = Integral.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @integrals }
    end
  end

  # GET /integrals/1
  # GET /integrals/1.xml
  def show
    @integral = Integral.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @integral }
    end
  end

  # GET /integrals/new
  # GET /integrals/new.xml
  def new
    @integral = Integral.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @integral }
    end
  end

  # GET /integrals/1/edit
  def edit
    @integral = Integral.find(params[:id])
  end

  # POST /integrals
  # POST /integrals.xml
  def create
    @integral = Integral.new(params[:integral])

    respond_to do |format|
      if @integral.save
        format.html { redirect_to(@integral, :notice => 'Integral was successfully created.') }
        format.xml  { render :xml => @integral, :status => :created, :location => @integral }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @integral.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /integrals/1
  # PUT /integrals/1.xml
  def update
    @integral = Integral.find(params[:id])

    respond_to do |format|
      if @integral.update_attributes(params[:integral])
        format.html { redirect_to(@integral, :notice => 'Integral was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @integral.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /integrals/1
  # DELETE /integrals/1.xml
  def destroy
    @integral = Integral.find(params[:id])
    @integral.destroy

    respond_to do |format|
      format.html { redirect_to(integrals_url) }
      format.xml  { head :ok }
    end
  end
end
