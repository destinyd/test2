class UserhomeController < InheritedResources::Base
  layout 'application' ,:only => [:new]
  before_filter :authenticate_user!
  respond_to :html
  respond_to :js, :only => :create
  protected
  def begin_of_association_chain
    current_user
  end
  def collection
    collection ||= end_of_association_chain.order('id desc').paginate(:page => params[:page])
  end
end
