class ShopsController < InheritedResources::Base
  #before_filter :authenticate_user!,:only =>[:new,:create,:update,:edit,:destroy]
  actions :all,:only => [:index,:show]
  belongs_to :city,:finder => :find_by_name!, :optional => true
  respond_to :html
  #respond_to :js, :only => :create
  protected
  def collection
    @shops ||= end_of_association_chain.paginate(:page => params[:page])
  end
end
