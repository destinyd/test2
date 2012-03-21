class Userhome::PricesController < UserhomeController
  #defaults :resource_class => Price,:collection_name => 'prices', :instance_name => 'price'
  layout 'userhome'
  before_filter :authenticate_user!
  respond_to :html
  respond_to :js, :only => :create
  def begin_of_association_chain
    current_user
  end
  def collection
    @prices ||= end_of_association_chain.paginate(:page => params[:page])
  end

end

