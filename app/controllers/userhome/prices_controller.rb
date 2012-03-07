class Userhome::PricesController < UserhomeController
  def collection
    @prices ||= end_of_association_chain.paginate(:page => params[:page])
  end

end

