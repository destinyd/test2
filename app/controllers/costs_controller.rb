class CostsController < InheritedResources::Base
  action :all,:only => [:index,:show]
  belongs_to :city,:finder => :find_by_name!, :optional => true
  respond_to :html
  protected
  def collection
    @shops ||= end_of_association_chain.paginate(:page => params[:page])
  end
end
