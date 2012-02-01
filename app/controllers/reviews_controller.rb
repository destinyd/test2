# coding: utf-8
class ReviewsController < ApplicationController
  before_filter :authenticate_user!#, :only => [:create]
  before_filter :find_reviewable
  before_filter :too_soon , :only =>[:new,:create,:up]
  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = @reviewable.reviews

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reviews }
    end
  end

  # GET /reviews/1
  # GET /reviews/1.json
#  def show
#    @review = @reviewable.reviews.find(params[:id])
#
#    respond_to do |format|
#      format.html # show.html.erb
#      format.json { render json: @review }
#    end
#  end

  # GET /reviews/new
  # GET /reviews/new.json
  def new
    @review = @reviewable.reviews.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @review }
    end
  end

  # GET /reviews/1/edit
#  def edit
#    @review = @reviewable.find(params[:id])
#  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = @reviewable.reviews.build(params[:review])
    @review.user = current_user

    respond_to do |format|
      if @review.save
        format.html { redirect_to :back, notice: t('notice.create_success')) }
        format.js 
      else
        #format.html { render action: "new" }
        format.js {render 'fault'}
      end
    end
  end

  # PUT /reviews/1
  # PUT /reviews/1.json
#  def update
#    @review = @reviewable.find(params[:id])
#
#    respond_to do |format|
#      if @review.update_attributes(params[:review])
#        format.html { redirect_to @review, notice: '@reviewable was successfully updated.' }
#        format.json { head :ok }
#      else
#        format.html { render action: "edit" }
#        format.json { render json: @review.errors, status: :unprocessable_entity }
#      end
#    end
#  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
#  def destroy
#    @review = @reviewable.find(params[:id])
#    @review.destroy
#
#    respond_to do |format|
#      format.html { redirect_to reviews_url }
#      format.json { head :ok }
#    end
#  end

private

  def find_reviewable
    params.each do |name, value|
        if name =~ /(.+)_id$/
            return @reviewable = $1.classify.constantize.find(value)
        end
    end
    nil
  end

  def too_soon
    if @reviewable.reviews.where(:user_id => current_user).count == 0
      true
    else
      @error = '你已经评价过了。'
    respond_to do |format|
      format.js {render 'fault.js'}
      format.html {redirect_to @reviewable,:notice  => '先歇歇，等会再来。'}
    end
      false
    end
  end
end
