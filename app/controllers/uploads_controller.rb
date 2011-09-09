class UploadsController < ApplicationController
  before_filter :find_uploadable
  before_filter :authenticate_user!,:except =>[:index,:show]

  # GET /uploads
  # GET /uploads.xml
  def index
    @uploads = @uploadable.nil? ? Upload.all : @uploadable.uploads

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @uploads }
    end
  end

  # GET /uploads/1
  # GET /uploads/1.xml
  def show
    @upload = Upload.find(params[:id],:include => :uploadable)

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /uploads/new
  # GET /uploads/new.xml
  def new
    @upload = current_user.uploads.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @upload }
    end
  end

  # GET /uploads/1/edit
  def edit
    @upload = current_user.uploads.find(params[:id])
  end

  # POST /uploads
  # POST /uploads.xml
  def create
    @upload = current_user.uploads.new(params[:upload])
    @upload.uploadable  = @uploadable

      if @upload.save
        redirect_to(@uploadable, :notice => 'Upload was successfully created.') 
      else
        render :action => "new"
      end
  end

  # PUT /uploads/1
  # PUT /uploads/1.xml
  def update
    @upload = current_user.uploads.find(params[:id])

    respond_to do |format|
      if @upload.update_attributes(params[:upload])
        format.html { redirect_to(@uploadable, :notice => 'Upload was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.xml
  def destroy
    @upload = current_user.uploads.find(params[:id])
    @upload.destroy

    respond_to do |format|
      format.html { redirect_to(uploads_url) }
      format.xml  { head :ok }
    end
  end
private

  def find_uploadable
    params.each do |name, value|
        if name =~ /(.+)_id$/
            return @uploadable = $1.classify.constantize.find(value)  
        end  
    end  
    nil  
  end
end
