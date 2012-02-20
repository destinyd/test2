class ShopsController < InheritedResources::Base
  before_filter :authenticate_user!,:only =>[:new,:create,:update,:edit,:destroy]
  respond_to :html
  respond_to :js, :only => :create
  protected
  def collection
    @shops ||= end_of_association_chain.paginate(:page => params[:page])
  end
end
