class FocusController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_focusable
  def index
    @focus = current_user.focuss
  end

  def show
    @focus = current_user.focuss.find(params[:id])
    redirect_to @focus.focusable#,@focus.focusable
  end

  def create
    @focus = current_user.focuss.build#(params[:focus])
    @focus.focusable = @focusable
    @focus.save
  end

  def destroy
    @focus = current_user.focuss.find(params[:id])
    @focus.destroy
  end

private

  def find_focusable 
    params.each do |name, value|  
        if name =~ /(.+)_id$/  
            return @focusable = $1.classify.constantize.find(value)  
        end  
    end  
    nil  
  end

end
