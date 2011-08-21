class MsgsController < ApplicationController
  # GET /msgs
  # GET /msgs.xml
  def index
    @msgs = Msg.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @msgs }
    end
  end

  # GET /msgs/1
  # GET /msgs/1.xml
  def show
    @msg = Msg.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @msg }
    end
  end

  # GET /msgs/new
  # GET /msgs/new.xml
  def new
    @msg = Msg.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @msg }
    end
  end

  # GET /msgs/1/edit
  def edit
    @msg = Msg.find(params[:id])
  end

  # POST /msgs
  # POST /msgs.xml
  def create
    @msg = Msg.new(params[:msg])

    respond_to do |format|
      if @msg.save
        format.html { redirect_to(@msg, :notice => 'Msg was successfully created.') }
        format.xml  { render :xml => @msg, :status => :created, :location => @msg }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @msg.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /msgs/1
  # PUT /msgs/1.xml
  def update
    @msg = Msg.find(params[:id])

    respond_to do |format|
      if @msg.update_attributes(params[:msg])
        format.html { redirect_to(@msg, :notice => 'Msg was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @msg.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /msgs/1
  # DELETE /msgs/1.xml
  def destroy
    @msg = Msg.find(params[:id])
    @msg.destroy

    respond_to do |format|
      format.html { redirect_to(msgs_url) }
      format.xml  { head :ok }
    end
  end
end
