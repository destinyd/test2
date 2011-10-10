class OutlinksController < ApplicationController
  before_filter :find_able
  before_filter :authenticate_user!, :only => [:new,:create,:edit,:update,:destroy]
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
    @outlink = current_user.outlinks.build
  end

  # GET /outlinks/1/edit
  def edit
    @outlink = current_user.outlinks.find(params[:id])
  end

  # POST /outlinks
  # POST /outlinks.xml
  def create
    @outlink = current_user.outlinks.new(params[:outlink])
    @outlink.outlinkable = @able

    respond_to do |format|
      if @outlink.save
        format.html {redirect_to :back,notice: 'success'}
        format.js
      else
        @error = ''
        @outlink.errors.full_messages.each do |msg|
          @error += msg
        end
        format.html {render :new}
        format.js{ render 'fault'}
      end
    end
  end

  # PUT /outlinks/1
  # PUT /outlinks/1.xml
  def update
    @outlink = current_user.outlinks.find(params[:id])

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
    @outlink = current_user.outlinks.find(params[:id])
    @outlink.destroy

    respond_to do |format|
      format.html { redirect_to(outlinks_url) }
      format.xml  { head :ok }
    end
  end
private

  def find_able
    params.each do |name, value|
        if name =~ /(.+)_id$/
            return @able = $1.classify.constantize.find(value)  
        end  
    end  
    nil  
  end
end
