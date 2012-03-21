class UserhomeController < InheritedResources::Base
  layout 'userhome'
  before_filter :authenticate_user!
  respond_to :html
  respond_to :js, :only => :create
  def begin_of_association_chain
    current_user
  end
  def collection
    resources ||= end_of_association_chain.paginate(:page => params[:page])
  end
end
