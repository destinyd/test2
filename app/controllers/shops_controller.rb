class ShopsController < InheritedResources::Base
  before_filter :authenticate_user!,:only =>[:new,:create,:update,:edit,:destroy]
  actions :all,:except => [:edit,:update,:destroy]
  belongs_to :city,:finder => :find_by_name!, :optional => true
  belongs_to :brand, :optional => true
  respond_to :html

  def create
     @shop = current_user.shops.new(params[:shop])
     create!
  end
  protected
  def collection
    @shops ||= end_of_association_chain.paginate(:page => params[:page])
  end
end
