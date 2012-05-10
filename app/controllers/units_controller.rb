class UnitsController < InheritedResources::Base
  before_filter :authenticate_user!,:only =>[:new,:create,:update,:edit,:destroy]
  actions :all,:except => [:edit,:update,:destroy]
  belongs_to :brand, :optional => true
  respond_to :html

  def create
     @unit = current_user.units.new(params[:unit])
     create!
  end
  protected
  def collection
    @units ||= end_of_association_chain.paginate(:page => params[:page])
  end
end

