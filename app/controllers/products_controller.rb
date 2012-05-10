class ProductsController < InheritedResources::Base
  before_filter :authenticate_user!,:only =>[:new,:create,:update,:edit,:destroy]
  actions :all,:except => [:edit,:update,:destroy]
  belongs_to :brand, :optional => true
  respond_to :html

  def create
     @product = current_user.products.new(params[:product])
     create!
  end

  def searchJSON
    @products = Product.where('name like ?' , '%' + params[:name_q] + '%')
    render :json => @products.to_json
  end

  protected
  def collection
    @products ||= end_of_association_chain.paginate(:page => params[:page])
  end
end
