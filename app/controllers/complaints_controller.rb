# coding: utf-8
class ComplaintsController < ApplicationController
  before_filter :authenticate_user!#, :only => [:create]
  before_filter :find_complaintable
  before_filter :too_soon , :only =>[:new,:create]
  # GET /complaints
  # GET /complaints.xml
  def index
    @complaints = @complaintable.complaints

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @complaints }
    end
  end

  # GET /complaints/1
  # GET /complaints/1.xml
  def show
    @complaint = @complaintable.complaints.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @complaint }
    end
  end

  # GET /complaints/new
  # GET /complaints/new.xml
  def new
    @complaint = @complaintable.complaints.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @complaint }
    end
  end

#  # GET /complaints/1/edit
#  def edit
#    @complaint = @complaintable.complaints.find(params[:id])
#  end

  # POST /complaints
  # POST /complaints.xml
  def create
    @complaint = @complaintable.complaints.build(params[:complaint])

    respond_to do |format|
      if @complaint.save
        format.html { redirect_to(@complaintable, :notice => 'Complaint was successfully created.') }
        format.xml  { render :xml => @complaint, :status => :created, :location => @complaint }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @complaint.errors, :status => :unprocessable_entity }
      end
    end
  end

#  # PUT /complaints/1
#  # PUT /complaints/1.xml
#  def update
#    @complaint = @complaintable.complaints.find(params[:id])
#
#    respond_to do |format|
#      if @complaint.update_attributes(params[:complaint])
#        format.html { redirect_to(@complaint, :notice => 'Complaint was successfully updated.') }
#        format.xml  { head :ok }
#      else
#        format.html { render :action => "edit" }
#        format.xml  { render :xml => @complaint.errors, :status => :unprocessable_entity }
#      end
#    end
#  end

#  # DELETE /complaints/1
#  # DELETE /complaints/1.xml
#  def destroy
#    @complaint = @complaintable.complaints.find(params[:id])
#    @complaint.destroy
#
#    respond_to do |format|
#      format.html { redirect_to(complaints_url) }
#      format.xml  { head :ok }
#    end
#  end

private

  def find_complaintable
    params.each do |name, value|
        if name =~ /(.+)_id$/
            return @complaintable = $1.classify.constantize.find(value)
        end
    end
    nil
  end

  def too_soon
    if @complaintable.complaints.where(:user_id => 1,:created_at => 5.minutes.ago..Time.now).count == 0
      true
    else
      redirect_to @complaintable,:notice  => '你对这货有那么多怨气吗？先歇歇，等会再来。'
      false
    end
  end
end
