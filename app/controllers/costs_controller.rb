class CostsController < InheritedResources::Base
  before_filter :authenticate_user!,:only => [:new,:create]
  actions :all, :except => [:edit,:update,:destroy]
  belongs_to :city,:finder => :find_by_name!, :optional => true
  respond_to :html

  def create
    @cost = current_user.costs.new params[:cost]
    create!
  end

  protected
  def collection
    @costs ||= end_of_association_chain.paginate(:page => params[:page])
  end
end
