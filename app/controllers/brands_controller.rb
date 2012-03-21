class BrandsController < InheritedResources::Base
  before_filter :authenticate_user!,:only =>[:new,:create,:update,:edit,:destroy]
  action :all,:except => [:edit,:update,:destroy]
  respond_to :html
  #respond_to :js, :only => :create
end

