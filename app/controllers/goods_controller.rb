class GoodsController < InheritedResources::Base
  before_filter :authenticate_user!, :only => [:new,:create,:edit,:update,:destroy]
  respond_to :html#, :json
  respond_to :json,:only => :searchJSON
  actions :all,:except => [:edit,:update,:destroy]
  belongs_to :breads, :optional => true
  belongs_to :shops, :optional => true

  def create
     @good = current_user.goods.new(params[:good])
     create!
  end

  def searchJSON
    @goods = Good.where('name like ?' , '%' + params[:name_q] + '%')
    render :json => @goods.to_json
  end

  def tags
    @tags = Good.tag_counts.includes(:taggings)
  end

  def tag
    @tagname = params[:id]
    @taggables  = Good.tagged_with params[:id]
  end

  protected
  def collection
    @goods ||= end_of_association_chain.paginate(:page => params[:page])
  end
end
