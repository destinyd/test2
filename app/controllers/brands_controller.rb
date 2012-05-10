class BrandsController < InheritedResources::Base
  before_filter :authenticate_user!,:only =>[:new,:create,:update,:edit,:destroy]
  actions :all,:except => [:edit,:update,:destroy]
  belongs_to :company, :optional => true
  respond_to :html

  def create
     @brand = current_user.brands.new(params[:brand])
     create!
  end

  def searchJSON
    @brands = Brand.where('name like ?' , '%' + params[:name_q] + '%')
    render :json => @brands.to_json
  end

  #respond_to :js, :only => :create
  protected
  def collection
    @brands ||= end_of_association_chain.paginate(:page => params[:page])
  end
end

