class ShopsController < InheritedResources::Base
  respond_to :html
  respond_to :js, :only => :create
  protected
  def collection
    @shops ||= end_of_association_chain.paginate(:page => params[:page])
  end
end
